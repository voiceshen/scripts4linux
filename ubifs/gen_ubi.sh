#!/bin/sh

# physical erase size = 128KiB
# sub-page size = 2048 bytes (no subpage)
# min I/O size = 2048 bytes
ubinize -o rootfs.ubi -p 0x20000 -m 0x800 -s 0x800 ubinize.cfg
