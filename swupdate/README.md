This is the config files necessary to build Buildroot for SWUpdate.
Note that you have to customize the config for busybox to add dhcp
server support, as well as customize the config for swupdate to add
support for running scripts and ubifs.

The buildroot configs has paths that are absolute on my machine, so
you will have to update them to reflect where things are located on
your machine. Note the buildroot-overlay folder contains files that
must be included in the buildroot image, the path for the overlay
in buildroot will need to be updated to point to this folder.

Once buildroot is built as a rootfs.cpio.xz file, it is combined with
a kernel generated from the kernel config in this folder (the zImage)
as well as the device tree and packaged as an itb file for U-Boot
to boot from (see included its file).

For reference I used 5.15-rc6 branch of the kernel with patches from
this repository applied, the devicetree from this repository, and
the buildroot branch of 2021.05.1. I'm sure newer branches should
work just fine though, but they may require some patching in certain
places or other config changes.
