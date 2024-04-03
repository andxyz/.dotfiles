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

# setup_docker_machine

# I switched to colima
#
export -- DOCKER_IP=0.0.0.0

# for my code editor to have access to linters and autocomplete etc etc
#
# launchctl setenv PATH "${PATH}"
# see also https://github.com/ersiner/osx-env-sync
#
#
if type launchctl &>/dev/null; then
  launchctl setenv PATH "${PATH}"
  launchctl setenv JAVA_HOME "${JAVA_HOME}"
fi
