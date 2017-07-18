#!/bin/bash
set -e
##################################################################################################################
# This are important utility that creates icons for connectivity.
##################################################################################################################

#Network

sudo pacman -S networkmanager --noconfirm --needed
sudo pacman -S network-manager-applet --noconfirm --needed
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service



echo "################################################################"
echo "#########   network connectivity has been installed  ###########"
echo "################################################################"

