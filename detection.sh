#!/bin/bash

echo "Begining detection sweep"
echo "press CTRL + C to exit at any given time"
echo ""

echo "Starting Airmon-ng......"

#ensures require tools are installed
sudo apt-get install aircrack-ng

#starts Airmon-ng on wireless adapter
sudo airmon-ng start wlan0

echo "Airmon-ng Started!"

#ensures probequest is installed properly
sudo pip3 install --upgrade probequest, pymongo, dnspython

while [ 1 ]
do

echo "Starting ProbeQuest ......Started"


#creates new terminal which will run the ProbeQuest scan
gnome-terminal -- probequest -i wlan0mon -o /home/pi/crowdDetection/VID.txt

#waits for 60 seconds
sleep 60

#uses pgrep to identift probequest's process id and passes this information into the kill command 
kill -int $(pgrep -l probequest | cut -d' ' -f1)

#waits for 5 seconds
sleep 5

#creates e=new terminal running the MAC Validation script
gnome-terminal -- /home/pi/crowdDetection/macval.sh


echo "restarting loop"
#Restarts the loop
done

