This is a work in progress, I am still working through issues on getting
mainline Debian working on an NTC CHIP/PocketCHIP. Note that for now
mainline Debian should work for Toshiba NAND CHIPs, so long as you either
build your own kernel or use DKMS to add the r8723bs and tca8418 keypad
drivers AND update the devicetree to define your MTD partitions. My config
uses command line partitioning, which requires rebuilding the kernel or adding
the cmdlinepart module via DKMS. For Hynix NAND, you must rebuild the kernel
with the patch titled
"0001-mtd-rawnand-hynix-Add-support-for-H27UCG8T2ETR-BC-ML.patch" applied if
your kernel version is less than 5.16.

If you wish to rebuild the kernel (or you have to due to the Hynix NAND) you
should enable the following options in addition to the default (as of 5.10/5.14)
Debian kernel options for armmp kernels: CONFIG_MTD_CMDLINE_PARTS (for command
line partitioning, not necessary if you will use devicetree partitioning),
CONFIG_KEYBOARD_TCA8418 (if you are using a PocketCHIP with keyboard), and
CONFIG_RTL8723BS (if you want to use the onboard WiFi).

I use debootstrap to build my image in a folder, configure it how I like (with
many of the included files placed in the correct location), then I create a
bootable ubifs image by running the script make-ubi.sh in the swupdate-gen-image
folder (like "./make-ubi.sh /path/to/debroot"). I then create an swu formatted
image by running build-image.sh in the same folder.

To build the kernel, I do the following:

Follow the steps from the page detailed here first to install prerequisites.
https://wiki.debian.org/HowToCrossBuildAnOfficialDebianKernelPackage
This includes installing the packages for crossbuild-essential-armhf.
I use apt-get source linux, but you are welcome to use the instructions in
the link above to get the kernel source. Once you download the necessary source,
apply the patch from this git to the kernel (go into the kernel source directory
and type "git apply path/to/patch" to apply the patch).

The setup I use for compiling the Debian kernel is ARCH=armhf, FEATURESET=none,
FLAVOUR=armmp. Note that following that guide after you do the step
fakeroot make -f debian/rules.gen setup_${ARCH}_${FEATURESET}_${FLAVOUR}
but before you do the step of
fakeroot make -f debian/rules.gen binary-arch_${ARCH}_${FEATURESET}_${FLAVOUR}
I do
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- -C debian/build/build_armhf_none_armmp menuconfig
and then add the necessary config options mentioned previously. When complete
you should have an installable set of debian files for your kernel.
