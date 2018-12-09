#importing the libaries that are that needed
import pymongo as py
import pandas as pd
import json
import ast

#reading the contents from the csv file
searchForMedalist = pd.read_csv('Summer_Olympic_medallists_1896-2008.csv', sep = ',',
			delimiter = None, encoding='latin-1')
			
winners = searchForMedalist[['Edition','Discipline','Event','Event_gender']].drop_duplicates()\
	.sort_values(['Edition','Discipline','Event','Event_gender'],
        ascending = [True,True, True,True])

#the actually variable that I went with
winnersName = searchForMedalist[['Athlete','NOC','Gender']].drop_duplicates()\
	.sort_values(['Athlete','NOC','Gender'],
        ascending = [True,True,True])

#connecting to the server	
myclient = py.MongoClient("mongodb://localhost:27017/")
#connecting to the database
mydb = myclient["DBMedalist"]
#connecting to the collection used
summerOlympicMedalists12many = mydb["summerOlympicMedalists12many"]

#code to take the contents of the files, creates the commands and write it to a js file
def writeafile(filename):
    file = open( filename,'w') 
    print('Opening ', filename)
    rec = 'use DBMedalist\n'
    file.write(rec)
    for q,r, s, in thisfile[['Athlete','NOC','Gender']].itertuples(index=False):
        tc = (searchForMedalist[(searchForMedalist['Athlete']==q) & (searchForMedalist['NOC']==r)
                                & (searchForMedalist['Gender']==s)])
        j = (tc.groupby(['Athlete','NOC','Gender'],as_index=False)
             .apply(lambda x:x[['City','Edition','Sport','Discipline','Event','Medal']].to_dict('r')).reset_index()
             .rename(columns={0:'AreaOfSpeciality'}).to_json(orient='records'))
        rec = 'db.summerOlympicMedalists12many.insert(' + str(j) + ')\n'
        file.write(rec)
    file.close()
    print('Closing ', filename)
    return()
	
#operation to insert the data from the file to the database
def insertIntoMongoDB():
    #specifing the dict size
    sample = {2}
    print('Starting the process of inserting the data into the database')
    #retrieving the info from the csv file
    for q,r, s, in thisfile[['Athlete','NOC','Gender']].itertuples(index=False):
        tc = (searchForMedalist[(searchForMedalist['Athlete']==q) & (searchForMedalist['NOC']==r)
                                & (searchForMedalist['Gender']==s)])
        j = (tc.groupby(['Athlete','NOC','Gender'],as_index=False)
             .apply(lambda x:x[['City','Edition','Sport','Discipline','Event','Medal']].to_dict('r')).reset_index()
             .rename(columns={0:'AreaOfSpeciality'}).to_json(orient='records'))
        #removing the fields to turn into a proper dict
        r1 = j.replace("[","",1)
        l = list(r1)
        del(l[len(r1) - 1])
        s = "".join(str(e) for e in l)
        #giving the info back to the dict
        sample = ast.literal_eval(s)
        #inserting the new data into the database
        summerOlympicMedalists12many.insert_one(sample)
        
    print('Completed the tasks for mongo')
    return()

#code practially runs from here
count = 1
countmax = round(len(winnersName)+.5)/1000
MAX = 11
#drop all contents from previous versions so we can continue to reuse the same database and data
summerOlympicMedalists12many.drop()
print(countmax)
while ((count <= countmax) & (count <= MAX)):
    filename = 'PersonEvents' + str(count) + '.js'
    print(filename,'start:',count*1000-1,' end: ', count*1000 + 999)
    thisfile = winnersName[count*1000 -1: count*1000 + 999]
    print(thisfile.head())
    print ('The count is:', count)
    b = insertIntoMongoDB()
    count = count + 1

print ("Finished - GoodBye!")
