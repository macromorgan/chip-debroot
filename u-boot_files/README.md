This directory contains the patches I use laid on top of upstream
U-Boot (specifically v2022.01) to enable booting the NTC CHIP from MLC
NAND in slc-emulation mode. This is necessary to boot a mainline kernel
later than 5.8 for the Toshiba NAND model (where the original
slc-emulation patches first appeared) and 5.16 for the SKHynix NAND
model (where the SKHynix specific patches have been mainlined).

Additionally, I have included patches that fix the upstream SPL not
being able to read from the NAND controller. If you wish to use a
mainline SPL you must apply the patch; if you use Allwinner's BOOT0
(not tested) or an older binary SPL from NTC's original images, it
is not necessary. Note that this current configuration makes an SPL
that is compatible only with the Toshiba model. If you wish to make an
SPL image compatible with the Hynix model, please change the config
option of CONFIG_SYS_NAND_OOBSIZE from 0x500 (for the Toshiba model)
to 0x680 (for the Hynix model).

There is a patch here to fix a known bug with upstream for the i2c
controller of the R8/A13 that must be applied to use U-Boot greater
than 2021.10.

I have also included a patch for the w1-gpio driver that increases
the time it takes to perform a reset of the w1 bus. This fixes issues
with the DIP autodetection not always working on cold boot.

There is a patch that adds support for immediately powerering down
the board if it was powered up due to a plug-in event (and not a
power button press).

Lastly, the chip.config file is the config I use to generate the
images.

By applying these patches on top of a clean v2022.01 build tree for
U-Boot, you should be able to create a bootable SPL and U-Boot stage
for flashing on your CHIP identical to the ones I generate and
distribute.

**addendum**
It would be wise to create a "flash-only" U-Boot that is used from SPL.
This flash-only U-Boot would differ in that you should disable the
power-down function on plug-in (since users boards would shut off as
soon as it is started from FEL and they would have to power up again
to start the process). Additionally, consider commenting out the
bad-block-table defined in the devicetree so that users can erase
bad blocks if they feel one was marked bad erroneously.
