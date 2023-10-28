#!/bin/bash

echo "Please make sure that the owner and group of squashfs_root_custom_wifi is set to root before you proceed!"

while true; do

read -p "Do you want to proceed? (y/n) " yn

case $yn in 
	[yY] ) echo ok, we will proceed;
		break;;
	[nN] ) echo exiting...;
		exit;;
	* ) echo invalid response;;
esac

done

mksquashfs ./squashfs_root_custom_wifi ./Papillote-Install-Iso/xzm/wifi_chooser_script.xzm -comp xz -b 256K -Xbcj x86 -noappend

cd Papillote-Install-Iso
bash make_iso.sh -f

if isohybrid -V &>/dev/null; then isohybrid -u ../Papillote.iso; else toolbox run isohybrid -V && toolbox run isohybrid -u ../Papillote.iso; el echo "isohybrid command doesn't seem to be present.  Please install and try again"; exit 1; fi

echo -e "Now insert a usb key, make sure it is unmounted and run the following command as admin:  sudo dd if=Papillote.iso of=[ your usb device address here ie /dev/sda ] status=progress"
