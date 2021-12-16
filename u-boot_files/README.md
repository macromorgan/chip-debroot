This directory contains the patches I use laid on top of upstream
U-Boot (specifically v2021.10) to enable booting the NTC CHIP from MLC
NAND in slc-emulation mode. This is necessary to boot a mainline kernel
later than 5.8 for the Toshiba NAND model (where the original
slc-emulation patches first appeared) and 5.16 for the SKHynix NAND
model (where the SKHynix specific patches have been mainlined).

Additionally, I have included patches that fix the upstream SPL not
being able to read from the NAND controller. If you wish to use a
mainline SPL you must apply the patch; if you use Allwinner's BOOT0
(not tested) or an older binary SPL from NTC's original images, it
is not necessary.

I have also included a patch for the w1-gpio driver that increases
the time it takes to perform a reset of the w1 bus. This fixes issues
with the DIP autodetection not always working on cold boot.

Lastly, the chip.config file is the config I use to generate the
images.

By applying these patches on top of a clean v2021.10 build tree for
U-Boot, you should be able to create a bootable SPL and U-Boot stage
for flashing on your CHIP. Please note the mainline SPL stage has
not yet been extensively tested.
