#!/bin/bash

DOCKER_IP=192.168.56.101

docker run -it \
    -v /var/run/docker.sock:/tmp/docker.sock \
    -h $DOCKER_IP \
    gliderlabs/registrator \
    consul://$DOCKER_IP:8500
