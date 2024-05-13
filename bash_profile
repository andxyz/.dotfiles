#!/usr/bin/env bash
# set -x
# set -e

# env shell configs
test -f ~/.shell/shell_envs        && source ~/.shell/shell_envs
test -f ~/.shell/path_envs         && source ~/.shell/path_envs
test -f ~/.shell/path_envs_private && source ~/.shell/path_envs_private
test -f ~/.shell/config_ruby_envs  && source ~/.shell/config_ruby_envs

## env for docker
test -f ~/.profile                 && source ~/.profile
test -f ~/.profile_wonolo_private  && source ~/.profile_wonolo_private

# for code editors to have access to linters and autocomplete see .profile
# launchctl setenv PATH ${PATH}

# source_node_env
source_ruby_env
