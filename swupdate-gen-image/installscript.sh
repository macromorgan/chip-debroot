#!/bin/sh

do_preinst()
{
    exit 0
}

do_postinst()
{
    current_lebs=$(cat /sys/class/ubi/ubi0_0/reserved_ebs)
    available_lebs=$(cat /sys/class/ubi/ubi0/avail_eraseblocks)
    eraseblock_size=$(cat /sys/class/ubi/ubi0/eraseblock_size)
    maximum_lebs=$(expr $current_lebs + $available_lebs)
    old_size=$(expr $current_lebs \* $eraseblock_size)
    new_size=$(expr $maximum_lebs \* $eraseblock_size)
    echo "Resizing rootfs from $old_size bytes to $new_size bytes."
    /usr/sbin/ubirsvol /dev/ubi0 -N rootfs --size=$new_size
    echo "Installation complete, rebooting system."
    /sbin/reboot
    exit 0
}

echo $0 $1 > /dev/ttyO0

case "$1" in
preinst)
    echo "call do_preinst"
    do_preinst
    ;;
postinst)
    echo "call do_postinst"
    do_postinst
    ;;
*)
    echo "default"
    exit 1
    ;;
esac
