#!/usr/bin/env zsh
# set -x
# set -e

# for my code editor to have access to linters and autocomplete etc etc
#
# launchctl setenv PATH "${PATH}"
# see also https://github.com/ersiner/osx-env-sync
#
#
launchctl setenv PATH "${PATH}"
launchctl setenv JAVA_HOME "${JAVA_HOME}"

[[ -f ~/.shell/config_ssh_agent ]]  && source ~/.shell/config_ssh_agent
[[ -f ~/.shell/path_envs ]]         && source ~/.shell/path_envs

# for my code editor to have working ssh
# and working language enviroments
use_osx_ssh_agent_setup
<<<<<<< HEAD
source_golang114_env
=======
source_golang113_env
>>>>>>> Update golang stuff, goland by jetbrains is amazing btw
source_ruby_env
source_node_env
