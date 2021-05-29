#! /usr//bin/python

#imports required librarys
import sys
import pymongo
import datetime

#gets current data and time
dt = datetime.datetime.now()

#prints current date and time
print (dt.strftime("%b-%d-%y %I:%M%p"))

#prints number of stored MAC Addresses
print sys.argv[1]

#Location data - this should be changed to the location the node will be installed in
location = "NorthSide"

#connects to MongoDB 
client = pymongo.MongoClient("mongodb+srv://Node:admin@cluster0.kxfj4.mongodb.net/Locations?retryWrites=true&w=majority")

#selects Database and collction 
db = client["Locations"]
collection = db[location]

#forms the data entry with the current data stored
count = { "Location": location, "Count": sys.argv[1], "Date/Time": dt.strftime("%b-%d-%y %I:%M%p")}

#prints data entry
print count

#uploads data entry to the database
x = collection.insert_one(count)

#prints the new data entrys id 
print (x.inserted_id)

