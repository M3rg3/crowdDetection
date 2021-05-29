#!/bin/bash

#Reads .txt file of Vendor ID's
values=$(</home/pi/crowdDetection/maclist.txt)

#counter used to count uniqe MAC Addresses with 
i=0

echo "validaiting"

#Waits 5 seconds
sleep 5

#reads collected MAC Addresses
filename='/home/pi/crowdDetection/VID.txt'

#Reads VID.txt file line by line
while read line; do

#breaks down lines from VID.txt to extract the MAC Addresses
mac=$( echo $line | cut -d ';' -f 2 )

#places MAC Address into Varible
str=$mac

echo $str

#checks to see if the MAC Address matches values in the Maclist.txt
if [[ "$values" == *"$str"* ]]; then
   echo "validated"

#check to see if MAC Address is currently in stored in array
   if [[ ! " ${mac_array[@]} " =~ "$str" ]];
     then
     #if MAC Address is not in array it gets added.
     mac_array+=$str
     echo "Adding validated mac add to array"
     ((i=i+1))
   fi
fi

#loop continues until every line of the VID.txt file has been validated
done < $filename

#final count of uniqe MAC Addresses which match the Vendor ID in maclist.txt
echo $i

#passes MAC Address count to data entry upload script
/home/pi/crowdDetection/dbupload.py  $i

#clears all data stored in the VID.txt
>/home/pi/crowdDetection/VID.txt


