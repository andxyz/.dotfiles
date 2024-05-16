#!/usr/bin/env bash
# set -x
# set -e

## Old docker-machine setup
#
# function setup_docker_machine() {
#   if command -v docker-machine &> /dev/null; then
#     return 22
#   fi
#
#   local RETVAL2=`docker-machine status`
#   if test "Stopped" != ${RETVAL2}; then
#     # set -x
#     eval "$(docker-machine env default)"
#     export DOCKER_IP=$(docker-machine ip default)
#     # set +x
#   fi
# }
#
# setup_docker_machine
#
# I switched to colima
#
# export -- DOCKER_IP=0.0.0.0
#

# I switched to lima-ctl
#
# sudo ln -s /Users/andxyz/.lima/docker/sock/docker.sock /var/run/docker.sock

# For my code editor to have access to lsp, linters and autocomplete, etc etc
#
# launchctl setenv PATH "${PATH}"
# see also https://github.com/ersiner/osx-env-sync
#
#
if type launchctl &>/dev/null; then
  launchctl setenv PATH "${PATH}"
  launchctl setenv JAVA_HOME "${JAVA_HOME}"
fi
