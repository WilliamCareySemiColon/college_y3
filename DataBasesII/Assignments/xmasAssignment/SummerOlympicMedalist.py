#importing the libaries that are that needed
#import pymongo as py
import pandas as pd

#reading the contents from the csv file

searchForMedalist = pd.read_csv('Summer_Olympic_medallists_1896-2008.csv', sep = ',',
			delimiter = None, encoding='latin-1')
			
winners = searchForMedalist[['Edition','Discipline','Event','Event_gender']].drop_duplicates()\
	.sort_values(['Edition','Discipline','Event','Event_gender'],
        ascending = [True,True, True,True])

winnersName = searchForMedalist[['Athlete','NOC','Gender']].drop_duplicates()\
	.sort_values(['Athlete','NOC','Gender'],
        ascending = [True,True,True])
#connecting to the server	
#myclient = py.MongoClient("mongodb://localhost:27017/")
#connecting to the database
#mydb = myclient["DBMedalist"]
#connecting to the collections
#summerOlympicMedalists = mydb["summerOlympicMedalists"]

#code from the MovingAirportToMongoDb
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

#variables that have been touched yet in the csv file 'City',

count = 1
countmax = round(len(winnersName)+.5)/1000
MAX = 11
print(countmax)
while ((count <= countmax) & (count <= MAX)):
    filename = 'PersonEvents' + str(count) + '.js'
    print(filename,'start:',count*1000-1,' end: ', count*1000 + 999)
    thisfile = winnersName[count*1000 -1: count*1000 + 999]
    print(thisfile.head())
    print ('The count is:', count)
    b = writeafile(filename)
    count = count + 1

print ("Finished - GoodBye!")
