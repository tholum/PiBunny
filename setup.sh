#!/bin/bash
apt install git vim isc-dhcp-server exfat-fuse exfat-utils npm
npm install .
dd if=/dev/zero of=/scripts/system.img bs=1M count=512
mkdosfs /scripts/system.img
mkdir /test
mount -o loop /scripts/system.img /test
cd /usr/src
git clone https://github.com/hak5/bashbunny-payloads.git
rsync -a /usr/src/bashbunny-payloads/payloads/ /test/
sync
umount /test

cd /usr/src
git clone git://github.com/quick2wire/quick2wire-gpio-admin.git
cd quick2wire-gpio-admin
make
sudo make install

rsync -av /scripts/etc/ /etc/
systemctl enable pibunny

#For my led script
sudo wget -O /usr/local/sbin/neouart https://github.com/bigjosh/NeoUart/releases/download/2/neouart
chmod +x /usr/local/sbin/neouart

