The kernel parameters are set in the flash-kernel default file. If you need to
modify the default kernel command line, do it here.

For the Source Parts Popcorn, you will need to change the root= reference and
remove all references to ubifs (as that device boots from eMMC).
