#!/bin/bash
set -e
##################################################################################################################
# This will install Gnome Desktop environment.
##################################################################################################################

echo "################################################################"
echo "------------------------   Gnome   -----------------------------"   
echo "################################################################"

package="gnome"

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

# gnome

echo "################################################################"
echo "---------------          gdm        ----------------------------"   
echo "################################################################"



package="gdm"

#----------------------------------------------------------------------------------

#checking if application is already installed or else install with aur helpers
if pacman -Qi $package &> /dev/null; then

	echo "################################################################"
	echo "############### "$package" is already installed ################"
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


package="gnome-extra"

#----------------------------------------------------------------------------------

#checking if application is already installed or else install with aur helpers
if pacman -Qi $package &> /dev/null; then

	echo "################################################################"
	echo "################## "$package" is already installed #############"
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





echo "Display manager being activated"

sudo systemctl enable gdm.service

echo "Reboot and select the proper desktop environment"
echo "with the gauge symbol."

echo "################################################################"
echo "###################    T H E   E N D      ######################"
echo "################################################################"

echo "Type sudo reboot"

