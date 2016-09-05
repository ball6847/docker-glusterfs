#!/bin/bash

# ENV DEBIAN_FRONTEND noninteractive
export DEBIAN_FRONTEND=noninteractive

apt-get update && \
apt-get install -y software-properties-common && \
add-apt-repository ppa:gluster/glusterfs-3.8 -y && \
apt-get update && \
apt-get install -y glusterfs-server


docker-compose exec gluster gluster peer probe 192.168.56.102
docker-compose exec gluster gluster volume create studentloan replica 2 transport tcp 192.168.56.101:/volumes/studentloan 192.168.56.102:/volumes/studentloan force
docker-compose exec gluster gluster volume start studentloan





docker-compose exec gluster gluster volume create myvolume transport tcp 192.168.56.101:/volumes force






gluster volume create myvolume gluster:/volume/`hostname` force
gluster volume start myvolume
