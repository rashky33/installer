#!/bin/bash
set -e
#======================================================================================         
# Start after installing base system 
#======================================================================================

echo "This is the opensource driver for intel"

echo " Xserver setup"

sudo pacman -S xorg-server xorg-apps xorg-xinit xorg-twm xterm --noconfirm --needed
sudo pacman -S xf86-video-intel --noconfirm --needed

echo "################################################################"
echo "###################    xorg installed for intel   ##############"
echo "################################################################"

