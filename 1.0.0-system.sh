#!/bin/bash
set -e
##################################################################################################################
# This must be installed before the xorg
##################################################################################################################

#System
sudo pacman -Syu

sudo pacman-key  --init
sudo pacman-key --populate archlinux
sudo pacman -S multilib-devel fakeroot git jshon wget make pkg-config autoconf automake patch --noconfirm --needed
sudo pacman -S xdg-user-dirs htop mlocate ntp hplip ifplugd modemmanager usb_modeswitch --noconfirm --needed
sudo pacman -S termite xcompmgr --noconfirm --needed
sudo pacman -S vim   --noconfirm --needed

sudo systemctl enableModemManager.service

echo "################################################################"
echo "##########   system drivers has been installed   ###############"
echo "################################################################"
