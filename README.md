## Image with dd
```dd if=/dev/zero of=bootloader.img bs=512 count=32767```
```dd if=./idbloader.img of=bootloader.img bs=512 seek=64 conv=notrunc```
```dd if=./u-boot.itb of=bootloader.img bs=512 seek=16384```
