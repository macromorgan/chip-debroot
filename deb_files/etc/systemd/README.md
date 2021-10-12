This is my systemd configuration. The ubihealthd is used to run a health daemon
in the background periodically checking for corruption on the ubifs. The
pocketkeys service is used to load the correct keymap at boot (I'm sure there
is a better way, but this is how I do it).

Additionally, I have made sure to disable sleep/hibernate/suspend as it seems
to play havok with the CHIP. I have also created links from hibernate.target,
hybrid-sleep.target, sleep.target, and suspend.target to /dev/null. I disabled
systemd from capturing the power key so that it can be used elsewhere. Lastly,
I created a symlink to enable getty@ttyGS0.service so that you can use the
USB Gadget as a console.
