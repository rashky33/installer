#!/bin/bash
set -e
##################################################################################################################
# This must be installed before the xorg
##################################################################################################################

#System
sudo pacman-key  --init
sudo pacman-key --populate archlinux
sudo pacman -S multilib-devel fakeroot git jshon wget make pkg-config autoconf automake patch --noconfirm --needed
sudo pacman -S xdg-user-dirs htop mlocate ntp hplip ifplugd modemmanager usb_modeswitch --noconfirm --needed
sudo pacman -S termite xcompmgr guvcview --noconfirm --needed
sudo pacman -S vim   --noconfirm --needed



echo "################################################################"
echo "##########   system drivers has been installed   ###############"
echo "################################################################"
