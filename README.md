Special Thanks to the following projects that made this possible ( I am not affiliated with any of them though )
* Hak5: For the idea https://hakshop.com/products/bash-bunny 
* http://isticktoit.net/?p=1383 For an example on getting usb gadgets working
* https://github.com/theresalu/rspiducky For a script to make QUACK posiible




### Pi zero Bash Bunny

Step 1: Install Raspbian 2017-03-02 ( Others may work?? )
Step 2: Boot it with a network connection, I used a pi zero w, so I just configured the wirelesss

/etc/wpa_supplicant/wpa_supplicant.conf

```
country=US
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
network={
        ssid="MYWIFI"
        psk="mypassword"
}
```

Boot the pi, Expand the fs ext... Then do this

```
sudo su
apt install git
cd /
git clone https://github.com/tholum/PiBunny.git scripts
cd /scripts
chmod +x *.sh
chmod +x bin/*
./setup.sh
reboot
```

* For arming mode pull pin 11 to 3.3v, 
* For switch1 ( the only mode at this point ) pull pin 11 to ground


This will not be a full replacement for a bash bunny, the bash bunny has a full ssd ( Much better speeds then a sd card ) And if you are using it for pen testing, would be much more likely to be plugged in by a target then a pi zero with a 3d printed case, Plus the guys at Hak5 do an amazing job of comunity develpment, and comming up with great out of the box ways of pen testing. I am not a pro pen tester, and only am interested in seeing if I can get it to work.

Current Status
[ WORKS ]
* ATTACKMODE successfully sets devices up
* QUACK
* bunny_helpers.sh Gets target_ip and other device info
* SWITCH BETWEEN arming and switch 1

[ Yet to do ]
* Test installing it to make sure all the needed files are where they need to be
* Add a switch2
* More docs ( Unlikly to actually happen unless there is interest :) )


