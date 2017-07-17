#!/bin/bash
set -e
##################################################################################################################
# Written to be used on 64 bits computers
# Special thanks to Erik Dubois. His work makes me inspire to try to create my own. I am not a programmer but self 
# study for this area.
# 
##################################################################################################################
##################################################################################################################
#
#   just trying to test some personal most used packages.
#
##################################################################################################################



sudo pacman -S cups cups-pdf ghostscript gsfonts libcups hplip system-config-printer foomatic-db foomatic-db-nonfree --noconfirm --needed
systemctl enable org.cups.cupsd.service
systemctl start org.cups.cupsd.service


echo "################################################################"
echo "#########   printer software has been installed       ##########"
echo "################################################################"

