FROM ubuntu:16.04
# FROM gluster
MAINTAINER Porawit Poboonma <ball6847@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.11.0.1/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

# temporary use thai mirror, because global ubuntu repository is very slow
RUN sed -i 's/archive.ubuntu/th.archive.ubuntu/g' /etc/apt/sources.list

RUN echo "deb http://ppa.launchpad.net/gluster/glusterfs-3.8/ubuntu xenial main" >> /etc/apt/sources.list.d/gluster.list && \
    echo "deb-src http://ppa.launchpad.net/gluster/glusterfs-3.8/ubuntu xenial main" >> /etc/apt/sources.list.d/gluster.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FE869A9 && \
    apt-get update && \
    apt-get install -y glusterfs-server openssh-server dnsutils

ADD services.d /etc/services.d

EXPOSE 22 111 24007 24008 49152 49156 38465 38466 38467

ENTRYPOINT ["/init"]
