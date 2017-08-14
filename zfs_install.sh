#!/bin/bash
set -e
##################################################################################################################
# This will install zfs filesystem if needed.
# This script is not tested yet. I would like to test it before it would be pushed to the repository.
##################################################################################################################

echo "################################################################"
echo "--------------------   ZFS filesystem   ------------------------"   
echo "################################################################"

package="zfs-dkms"

#----------------------------------------------------------------------------------

#checking if application is already installed or else install with aur helpers
if pacman -Qi $package &> /dev/null; then

	echo "################################################################"
	echo "########### "$package" is already been installed  ##############"
	echo "################################################################"

else

	#checking which helper is installed
	if pacman -Qi packer &> /dev/null; then

		echo "Installing with packer"
		packer -S --noconfirm --noedit  $package

	elif pacman -Qi pacaur &> /dev/null; then
		
		echo "Installing with pacaur"
		pacaur -S --noconfirm --noedit  $package
		 	
	elif pacman -Qi yaourt &> /dev/null; then

		echo "Installing with yaourt"
		yaourt -S --noconfirm $package
			  	
	fi


fi

#----------------------------------------------------------------------------------
sudo modprobe zfs

cp /etc/zfs/zpool.cache /mnt/etc/zfs/zpool.cache

echo "########################################################################"
echo "Dont forget to check if this file exist & if not manually copy this file"
echo " cp /etc/zfs/zpool.cache /mnt/etc/zfs/zpool.cache"
echo "########################################################################"
echo "ZFS has been activated"

sudo systemctl enable zfs.target
sudo systemctl enable zfs-import-cache
sudo systemctl enable zfs-mount

#add HOOKS="...... zfs ..." to your mkinitcpio.conf.

echo "################################################################"
echo "###################    T H E   E N D      ######################"
echo "################################################################"


