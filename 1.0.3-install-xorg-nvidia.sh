#!/bin/bash
set -e
#======================================================================================
# Start after installing the base system.
#======================================================================================

echo "This is the opensource driver for nvidia"

echo " Xserver setup"

sudo pacman -S xorg-server xorg-apps xorg-xinit xorg-twm xterm --noconfirm --needed
sudo pacman -S xf86-video-nouveau --noconfirm --needed

echo "################################################################"
echo "###########    xorg-nvidia has been installed    ###############"
echo "################################################################"

