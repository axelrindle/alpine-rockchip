FROM alpine AS build

RUN apk add --no-cache \
        alpine-sdk \
        bc \
        bison \
        dtc \
        flex \
        gnutls-dev \
        linux-headers \
        ncurses-dev \
        openssl-dev \
        python3-dev \
        py3-elftools \
        py3-setuptools \
        swig \
        util-linux-dev

# Create build directory
RUN mkdir -p /build/boot

WORKDIR /build/boot

# Clone U-Boot
RUN git clone https://github.com/u-boot/u-boot.git
RUN git clone https://github.com/rockchip-linux/rkbin.git

ENV ROCKCHIP_TPL=/build/boot/rkbin/bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2400MHz_v1.18.bin
ENV BL31=/build/boot/rkbin/bin/rk35/rk3588_bl31_v1.47.elf

WORKDIR /build/boot/u-boot

RUN make turing-rk1-rk3588_defconfig

RUN make ARCH=arm -j$(nproc)

# Copy the compiled U-Boot to the output directory
RUN mkdir -p out
RUN cp /build/boot/u-boot/idbloader.img ./out
RUN cp /build/boot/u-boot/u-boot.itb ./out


FROM scratch AS bin

COPY --from=build /build/boot/u-boot/out /out
