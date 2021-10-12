Add your modprobe parameters here. By default I blacklist the w1_gpio module
because it causes issues with kernels >= 5.14 (possibly earlier, I didn't
test earlier revisions than 5.10 which worked).
