#!/bin/bash

##################################################################################################################
# This will install bluetooth drivers for the system.
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

sudo pacman -S --noconfirm --needed pulseaudio-bluetooth bluez bluez-libs bluez-utils bluez-firmware blueberry 

sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
sudo systemctl daemon-reload


echo "reboot your system then ..."
echo "set with bluetooth icon in upper right corner"
echo "change with pavucontrol to have a2dp sink"


echo "################################################################"
echo "########  bluetooth driver has been installed    ###############"
echo "################################################################"
