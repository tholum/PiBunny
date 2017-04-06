#!/bin/bash
apt install git vim isc-dhcp-server exfat-fuse exfat-utils
systemctl enable pibunny


#For my led script
sudo wget -O /usr/local/sbin/neouart https://github.com/bigjosh/NeoUart/releases/download/2/neouart
chmod +x /usr/local/sbin/neouart

