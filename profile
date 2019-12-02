#!/usr/local/bin/bash
# set -x
# set -e

function setup_docker_machine() {
  local RETVAL=`docker-machine status`
  if test "Stopped" != ${RETVAL}
  then
    set -x
    eval "$(docker-machine env default)"
    export DOCKER_IP=$(docker-machine ip default)
    export DOCKER_MACHINE_IP="192.168.99.100"
    set +x
  fi
}

setup_docker_machine
