#!/usr/bin/env bash

[[ -f ~/.shell/paths ]]             && source ~/.shell/paths
[[ -f ~/.shell/paths_private ]]     && source ~/.shell/paths_private

## generic shell configs
[[ -f ~/.shell/config ]]            && source ~/.shell/config
[[ -f ~/.shell/config_ssh_agent ]]  && source ~/.shell/config_ssh_agent
[[ -f ~/.shell/config_ruby ]]       && source ~/.shell/config_ruby
[[ -f ~/.shell/config_private ]]    && source ~/.shell/config_private
[[ -f ~/.shell/aliases ]]           && source ~/.shell/aliases
[[ -f ~/.shell/aliases_private ]]   && source ~/.shell/aliases_private
[[ -f ~/.shell/functions ]]         && source ~/.shell/functions
[[ -f ~/.shell/functions_private ]] && source ~/.shell/functions_private
[[ -f ~/.shell/ruby_rails_tricks.sh ]] && source ~/.shell/ruby_rails_tricks.sh

## bash specific
[[ -f ~/.bash/config_bash ]]        && source ~/.bash/config_bash
[[ -f ~/.bash/aliases_bash ]]       && source ~/.bash/aliases_bash
[[ -f /usr/local/etc/bash_completion ]] && source /usr/local/etc/bash_completion
[[ -r $NVM_DIR/bash_completion ]]       && source $NVM_DIR/bash_completion

## use .localrc for settings specific to one system
[[ -f ~/.localrc ]]                 && source ~/.localrc
