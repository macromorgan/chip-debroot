Here is my configuration for initramfs-tools. I manually select all of the
modules for the initramfs, some of these are probably optional or could be
loaded later. It's important to load the drivers you need for your initrootfs,
otherwise the system may be unbootable. Additionally adding the crypto engine
drivers in the initramfs causes a bug, so those are purposefully loaded later
in the boot process.
