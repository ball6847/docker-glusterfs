#!/bin/bash

# ENV DEBIAN_FRONTEND noninteractive
export DEBIAN_FRONTEND=noninteractive

apt-get update && \
apt-get install software-properties-common && \
add-apt-repository ppa:gluster/glusterfs-3.8 -y && \
apt-get update && \
apt-get install -y glusterfs-server
