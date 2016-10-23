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
        xorg-x11-server-Xvfb \
        && dnf clean all \
        && rm -rf \
            /var/lib/dnf/* \
            /tmp/* \
            /var/tmp/* \
            /usr/share/locale/*

RUN useradd -ms /bin/bash lfs
USER lfs
WORKDIR /home/lfs





CMD /home/lfs/lfs.sh
