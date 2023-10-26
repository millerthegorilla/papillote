# papillote
A repository for a custom wifi chooser dialog for Porteus-Kiosk to recondition laptops into safe browsers for kids.

This repository is for a custom module for porteus kiosk edition, that uses gtkdialog and various wifi/ip tools to display a list of detected wifi networks and then present a password box to obtain the wifi network password.  It then either connects, and displays a notification, or fails to connect and displays a separate notification.

This addition to porteus kiosk means that I can install it on an old laptop, and then pass that laptop on to a low income household, that the child can be left with, that will only show youtube, and child safe sites (fixya etc).  If the child visits a friend then the parent can connect to the wifi, using this module.

I include the porteus kiosk configuration details that I use.

##Instructions for use

Download the source code, and then, in the root directory, type the following:

```bash
sudo chown -R root:root ./squashfs_root_custom_wifi/*
mkdir ../Porteus-Kiosk-Install-Iso
mksquashfs ./squashfs_root_custom_wifi ../Porteus-Kiosk-Install-Iso/xzm/wifi_chooser_script.xzm -comp xz -b 256K -Xbcj x86 -noappend
cd ../Porteus-Kiosk-Install-Iso
sh make_iso.sh
isohybrid -u ../Porteus-Kiosk.iso
```
This will create an iso for you to burn on to a usb device, using dd.

Install porteus kiosk as usual, using the usb device.  When it is installed, press ```CTRL-ALT-W``` will bring up the wifi dialog.

Note in the configuration settings that I set custom DNS to opendns family shield, which further protects the laptop user. (https://www.opendns.com/setupguide/#familyshield)

Also, youtube offers a password protected child safe filter, that the parent can use to make sure that youtube search doesn't show any inappropriate content.

Enjoy!

## Todo

- The wifi chooser currently only works with wpa2 wifi connections.  It could do with being expanded to include open networks and WEP networks, and also to make sure that wired networking is available and works.

- Testing, testing, testing.

