# alpine-rockchip

## Image with dd

```shell
dd if=/dev/zero of=bootloader.img bs=512 count=32767
```

```shell
dd if=./idbloader.img of=bootloader.img bs=512 seek=64 conv=notrunc
```

```shell
dd if=./u-boot.itb of=bootloader.img bs=512 seek=16384
```
