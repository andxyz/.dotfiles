#!/usr/bin/env zsh
# set -x
# set -e

# TODO: make it work
# forcing paths on a mac
export -- PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

# env shell configs
test -f ~/.shell/shell_envs        && source ~/.shell/shell_envs
test -f ~/.shell/path_envs         && source ~/.shell/path_envs
test -f ~/.shell/path_envs_private && source ~/.shell/path_envs_private
test -f ~/.shell/config_ruby_envs  && source ~/.shell/config_ruby_envs

## env zsh specific
test -f ~/.shell/paths_zsh         && source ~/.zsh/zsh_paths

## env for docker
test -f ~/.profile         && source ~/.profile

# for code editors to have access to linters and autocomplete see zshenv
# launchctl setenv PATH $PATH
# TODO: make it work
# function source_node_env() {
  test -f $HOME/.nvm/nvm.sh  && source $HOME/.nvm/nvm.sh
# }

# source_ruby_env() {
  test -d $HOME/.rbenv/bin &&
  export -- PATH="$HOME/.rbenv/bin:$PATH" &&
  eval "$(rbenv init -)"
# }
