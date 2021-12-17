This directory contains the patches necessary to make a mainline kernel
work for the NTC CHIP (and includes fixes that also apply to the Source
Parts Popcorn).

The patch to add support for the Hynix NAND allows it to work on a
mainline kernel in emulated slc mode, and is not necessary for kernels
greater than or equal to version 5.16.

There is a patch that fixes the HDMI coloration for the official NTC
HDMI DIP/Source Parts Stovetop. This patch changes the color order from
BGR to RGB (this will need to likely be mainlined either as a
device-tree parameter or auto-detected somehow from the HDMI
connector).

There is a patch that fixes an issue with the i2c bus that occurs when
you shut down the system. Without the patch the system will freeze on
shutdown and spew into the kernel log various errors about locking the
bus and no atomic writes supported. With the patch you still get dmesg
spew, but it's just warnings about atomic writes not being supported
and the system shuts down cleanly.

Lastly, I have included the config I used to compile the official
downstream Debian Kernel (specifically the 5.14 armmp branch). 
