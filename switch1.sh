#!/bin/bash
mount -o loop /scripts/system.img /root/udisk
cd /root/udisk/switch1/
sed -i 's/\r$//' payload.txt
chmod +x payload.txt
./payload.txt
