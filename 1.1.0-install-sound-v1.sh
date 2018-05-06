#!/bin/bash
set -e
##################################################################################################################
# This will be next to xorg installation
##################################################################################################################

#Sound
sudo pacman -S pulseaudio pulseaudio-alsa pavucontrol  --noconfirm --needed
sudo pacman -S alsa-utils alsa-plugins alsa-lib alsa-firmware --noconfirm --needed
sudo pacman -S gst-plugins-good gst-plugins-bad gst-plugins-base gst-plugins-ugly  gstreamer  --noconfirm --needed
sudo pacman -S mplayer gnome-mplayer  --noconfirm --needed



echo "################################################################"
echo "##########   sound drivers has been installed   ################"
echo "################################################################"

