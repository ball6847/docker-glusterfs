#!/bin/bash

docker service create \
    --name gluster \
    --network gluster \
    --mount type=bind,source=/volume,target=/volume \
    ball6847/gluster:dev
