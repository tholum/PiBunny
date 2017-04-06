#/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
echo 17 > /sys/class/gpio/export
#sleep 60
LED R 100
PIN_VALUE=`cat /sys/class/gpio/gpio17/value`
echo $PIN_VALUE > /scripts/last_pin
if [ "$PIN_VALUE" == "1" ]
then
	/bin/ATTACKMODE STORAGE "FILE_IMAGE=/scripts/system.img" 
fi
LED GB 
