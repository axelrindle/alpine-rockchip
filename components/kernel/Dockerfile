FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y \
        build-essential \
        git \
        linux-source \
        libncurses-dev \
        gcc-aarch64-linux-gnu

RUN git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git /usr/local/src/linux

WORKDIR /usr/local/src/linux

COPY docker-entrypoint.sh .
COPY .config .

RUN chmod +x docker-entrypoint.sh

CMD [ "./docker-entrypoint.sh" ]
