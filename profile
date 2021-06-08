#!/usr/local/bin/bash
# set -x
# set -e

function setup_docker_machine() {
  if command -v docker-machine &> /dev/null; then
    return 22
  fi

  local RETVAL2=`docker-machine status`
  if test "Stopped" != ${RETVAL2}; then
    # set -x
    eval "$(docker-machine env default)"
    export DOCKER_IP=$(docker-machine ip default)
    # set +x
  fi
}

setup_docker_machine
