This is a work in progress, I am still working through issues on getting
mainline Debian working on an NTC CHIP/PocketCHIP. Note that for now
mainline Debian should work for Toshiba NAND CHIPs, so long as you either
build your own kernel or use DKMS to add the r8723bs and tca8418 keypad
drivers AND update the devicetree to define your MTD partitions. My config
uses command line partitioning, which requires rebuilding the kernel or adding
the cmdlinepart module via DKMS. For Hynix NAND, you must rebuild the kernel
with the patch titled
"0001-mtd-rawnand-hynix-Add-support-for-H27UCG8T2ETR-BC-ML.patch" applied.
If you wish to rebuild the kernel (or you have to due to the Hynix NAND) you
should enable the following options in addition to the default (as of 5.10/5.14)
Debian kernel options for armmp kernels: CONFIG_MTD_CMDLINE_PARTS (for command
line partitioning, not necessary if you will use devicetree partitioning),
CONFIG_KEYBOARD_TCA8418 (if you are using a PocketCHIP with keyboard), and
CONFIG_RTL8723BS (if you want to use the onboard WiFi).

I use debootstrap to build my image in a folder, configure it how I like (with
many of the included files placed in the correct location), then I create a
bootable ubifs image by doing the following:

sudo mkfs.ubifs -q -r /path/to/debroot -m 16384 -e 2064384 -c 2048 -o nand.ubi
ubinize -o root.ubi -m 16384 -p 2097152 ubi.cfg
