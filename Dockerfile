#
# A Debian Jessie container with helper scripts for installing packages
#
# todo: this is pretty much identical to bwstitt/library-ubuntu
#

FROM debian:jessie

RUN groupadd -g 911 abc \
 && useradd -m -s /bin/bash -g 911 -u 911 abc

ADD ./src/docker-apt-install.sh /usr/local/sbin/docker-apt-install
RUN chmod 500 /usr/local/sbin/docker-apt-install

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" >/etc/apt/sources.list.d/backports.list \
 && docker-apt-install apt-utils
