#!/usr/local/bin/bash
# set -x
# set -e

eval "$(docker-machine env default)"
export DOCKER_IP=$(docker-machine ip default)
export DOCKER_MACHINE_IP="192.168.99.100"