Crowd Detection System - installation guide 

To install this system and create a wireless detection node the following steps are needed to be done:

1 - ensure the crowdDetection repository is located at /home/pi/

2 - edit the file DBupload.py and change the location varible to location this node will be installed

3 - add the following line "@lxterminal -e sudo /home/pi/crowdDetection/detection.sh" by editing the autostart file stored at "/etc/xdg/lxsession/LXDE-pi/autostart" using the text editor of your choice.

4 - restart the device to confirm the scripts function properly.
