This folder contains the custom boot scripts used to boot from NAND.
Note this differs from the sunxi script by removing a lot of
unnecessary steps. It also adds support for automatic adding of
overlays from the /boot/overlays directory based on the DIP detection
logic in U-Boot (DIP detection is required to be build in to U-Boot to
use this). Additionally, I lower and then raise GPIO PB4 to reset the
bluetooth at each boot. If this is not done bluetooth will not work
on warm boots.
