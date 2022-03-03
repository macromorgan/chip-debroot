This directory contains files necessary to generate your own swupdate
images. In order to generate an image first you need to create a
rootfs.ubifs image with the make-ubi.sh script. Run it like this:
"./make-ubi.sh /path/to/rootfiles" where /path/to/rootfiles is your
rootfs.

Once a rootfs.ubifs image is generated, you can package it into
swupdate format by running ./build-image.sh.

The script "installscript.sh" is used in the swu image itself and
is run after successfully installing the swupdate image to NAND.
Right now it resizes the ubifs volume to fill the NAND and then
reboots the device.

*Note that for some reason resizing the Toshiba NAND worked when I
specified the resize operation by LEBs, however to make it work
with the Hynix chip I have to resize it by bytes. Since bytes also
works with the Toshiba image, this is what I do for both.
