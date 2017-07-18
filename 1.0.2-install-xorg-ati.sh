#!/bin/bash
set -e
#======================================================================================
# Start after installing the base system.        
#======================================================================================

echo "This is the opensource driver for AMD"

echo " Xserver setup"

sudo pacman -S xorg-server xorg-apps xorg-xinit xorg-twm xterm --noconfirm --needed
sudo pacman -S xf86-video-ati --noconfirm --needed

echo "################################################################"
echo "##########    xorg-amd drivers has been installed     ##########"
echo "################################################################"

