#!/bin/sh

set -ex

cd rkbin
git pull

cd ../u-boot
git pull

make turing-rk1-rk3588_defconfig
make ARCH=arm -j$(nproc)

dd if=/dev/zero of=bootloader.img bs=512 count=32767
dd if=./idbloader.img of=bootloader.img bs=512 seek=64 conv=notrunc
dd if=./u-boot.itb of=bootloader.img bs=512 seek=16384

cp bootloader.img /out
