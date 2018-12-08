#importing the libaries that are that needed
#import pymongo as py
import pandas as pd

#reading the contents from the csv file

searchForMedalist = pd.read_csv('Summer_Olympic_medallists_1896-2008.csv', sep = ',',
			delimiter = None, encoding='latin-1')
			
winners = searchForMedalist[['Edition','Discipline','Event','Event_gender']].drop_duplicates()\
	.sort_values(['Edition','Discipline','Event','Event_gender'],
        ascending = [True,True, True,True])

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
    for q,r, s, t, in thisfile[['Edition','Discipline','Event','Event_gender']].itertuples(index=False):
        tc = (searchForMedalist[(searchForMedalist['Edition']==q) & (searchForMedalist['Discipline']==r)
                                & (searchForMedalist['Event']==s) & (searchForMedalist['Event_gender']==t) ])
        j = (tc.groupby(['Edition','Discipline','Event','Event_gender'],as_index=False)
             .apply(lambda x:x[[]].to_dict('r')).reset_index())
        #.apply(lambda x: x[['AirportId','Name','IATA_FAA', 'ICAO','Latitude','Longitude','Altitude_ft']]
              # .to_dict('r')).reset_index().rename(columns={0:'Airports'}).to_json(orient='records'))
        rec = 'db.summerOlympicMedalists.insert(' + str(tc) + ')\n'
        file.write(rec)
    file.close()
    print('Closing ', filename)
    return()

#variables that have been touched yet in the csv file 'City',
#City Discipline Medal Gender
count = 1
countmax = round(len(winners)+.5)/1000
print(countmax)
while (count <= countmax):
    filename = 'Events' + str(count) + '.js'
    print(filename,'start:',count*1000-1,' end: ', count*1000 + 999)
    thisfile = winners[count*1000 -1: count*1000 + 999]
    print(thisfile.head())
    print ('The count is:', count)
    b = writeafile(filename)
    count = count + 1

print ("Finished - GoodBye!")
