FROM alpine:3

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

RUN mkdir -p /usr/local/src

WORKDIR /usr/local/src

RUN git clone https://github.com/u-boot/u-boot.git
RUN git clone https://github.com/rockchip-linux/rkbin.git

ENV ROCKCHIP_TPL=/usr/local/src/rkbin/bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2400MHz_v1.18.bin
ENV BL31=/usr/local/src/rkbin/bin/rk35/rk3588_bl31_v1.47.elf

COPY docker-entrypoint.sh .

RUN chmod +x docker-entrypoint.sh

CMD [ "./docker-entrypoint.sh" ]
