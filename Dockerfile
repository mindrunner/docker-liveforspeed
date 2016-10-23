FROM fedora:latest
MAINTAINER Lukas Elsner <open@mindrunner.de>

RUN dnf -q upgrade -y && \
    dnf install -y \
        curl \
        ca-certificates \
        glibc.i686 \
        libstdc++.i686 \
        python \
        wine \
        unzip \
        xorg-x11-server-Xvfb \
        && dnf clean all \
        && rm -rf \
            /var/lib/dnf/* \
            /tmp/* \
            /var/tmp/* \
            /usr/share/locale/*

RUN useradd -ms /bin/bash lfs
USER lfs

RUN mkdir /home/lfs/app
RUN mkdir /home/lfs/data

WORKDIR /home/lfs/app

RUN curl -o lfs-server.zip https://www.lfs.net/download/LFS_S3_DCON_6Q.zip \
    && unzip lfs-server.zip \
    && rm lfs-server.zip
    
CMD wine DCon.exe /cfg=/home/lfs/data/setup.cfg
