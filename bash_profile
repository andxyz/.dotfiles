#!/usr/bin/env bash
# set -x
# set -e

# env shell configs
[[ -f ~/.shell/shell_envs ]]        && source ~/.shell/shell_envs
[[ -f ~/.shell/path_envs ]]         && source ~/.shell/path_envs
[[ -f ~/.shell/path_envs_private ]] && source ~/.shell/path_envs_private
[[ -f ~/.shell/config_ruby_envs ]]  && source ~/.shell/config_ruby_envs
## env for docker
[[ -f ~/.profile ]]                 && source ~/.profile
