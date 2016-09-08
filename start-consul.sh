#!/bin/bash

DOCKER_IP=192.168.56.101

exec docker run -it \
    -h node \
    -p 8500:8500 \
    -p 8600:53/udp \
    progrium/consul -server -bootstrap -advertise $DOCKER_IP -log-level debug
