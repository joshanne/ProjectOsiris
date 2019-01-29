# ******************************************************************
# Script to reboot directly into windows from linux
#   Inspired by answer at stack exchange: https://unix.stackexchange.com/a/112284
# ******************************************************************
function grubonce {
    WINDOWS_TITLE=`grep -i 'windows' /boot/grub/grub.cfg|cut -d"'" -f2`
    sudo grub-reboot "$WINDOWS_TITLE"
    sudo reboot
}