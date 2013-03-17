#!/bin/sh

# build file system from directory DIR = rootfs
# logical erase block size = 0x1f000 bytes 
# max leb cnt = 4096
# minimum I/O unit size = 2048 bytes
mkfs.ubifs -d rootfs -e 0x1f000 -c 4096 -m 0x800 -o rootfs.ubifs
