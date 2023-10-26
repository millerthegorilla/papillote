#!/bin/bash
# ---------------------------------------------------------
# Script to create bootable Porteus Kiosk ISO.
# Author: T.Jokiel <http://porteus-kiosk.org>
# ---------------------------------------------------------

echo "This script will create Porteus Kiosk ISO from files in current directory."
echo "Press enter to proceed."
read

# UEFI check:
[ -e boot/isolinux/efi/efiboot.img ] && efi="-eltorito-alt-boot -eltorito-platform 0xEF -eltorito-boot boot/isolinux/efi/efiboot.img -no-emul-boot"

mkisofs -o ../Porteus-Kiosk.iso -l -J -joliet-long -R -D -A "Kiosk" \
-V "Kiosk" -no-emul-boot -boot-info-table -boot-load-size 4 \
-b boot/isolinux/isolinux.bin -c boot/isolinux/isolinux.boot $efi . > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "Saved as [1;33m`pwd | rev | cut -d/ -f2- | rev`/Porteus-Kiosk.iso[0m."
else
    echo "Something went wrong - could not create the ISO. Please use 'mkisofs' utility from latest 'cdrtools' package rather than 'cdr-kit'."
    echo "You can download 'mkisofs' utility directly from this location: http://porteus-kiosk.org/public/files/mkisofs"
    echo "make it executable, move to /usr/local/bin folder and rerun this script."
    sleep 2
fi
