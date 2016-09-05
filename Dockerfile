# FROM ubuntu:16.04
FROM gluster
MAINTAINER Porawit Poboonma <ball6847@gmail.com>

# ENV DEBIAN_FRONTEND=noninteractive
#
#
# RUN apt-get update && \
#     apt-get install -y software-properties-common && \
#     add-apt-repository ppa:gluster/glusterfs-3.8 -y && \
#     apt-get update && \
#     apt-get install -y glusterfs-server

ADD entrypoint.sh /entrypoint.sh

EXPOSE 111 24007 24008 49152 49156 38465 38466 38467

ENTRYPOINT [ "/entrypoint.sh" ]
