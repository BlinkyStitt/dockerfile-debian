#
# A Debian Jessie container with helper scripts for installing packages
#
# todo: this is pretty much identical to bwstitt/library-ubuntu
#
FROM debian:jessie

RUN groupadd -g 911 abc \
 && useradd -m -s /bin/bash -g 911 -u 911 abc

COPY docker-apt-install.sh /usr/local/sbin/docker-install

RUN set -eux; \
    \
    echo "deb http://ftp.debian.org/debian jessie-backports main" >/etc/apt/sources.list.d/backports.list; \
    docker-install apt-utils
