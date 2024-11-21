#!/bin/sh

git fetch --tags

git checkout v6.12

make mrproper
make defconfig ARCH=arm64
make -j$(nproc) ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
