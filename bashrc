#!/usr/bin/env bash
# set -x
# set -e

## for interactive shell
[ -n "$PS1" ] && [[ -f ~/.shell/config_interactive_shell ]]   && source ~/.shell/config_interactive_shell
[ -n "$PS1" ] && [[ -f ~/.shell/config_interactive_private ]] && source ~/.shell/config_interactive_private
[[ -f ~/.shell/config_ssh_agent ]]  && source ~/.shell/config_ssh_agent
[[ -f ~/.shell/aliases ]]           && source ~/.shell/aliases
[[ -f ~/.shell/aliases_private ]]   && source ~/.shell/aliases_private
[[ -f ~/.shell/functions ]]         && source ~/.shell/functions
[[ -f ~/.shell/functions_private ]] && source ~/.shell/functions_private
[[ -f ~/.shell/ruby_rails_tricks.sh ]] && source ~/.shell/ruby_rails_tricks.sh

## for bash interactive specific
[ -n "$PS1" ] && [[ -f ~/.bash/config_bash ]]        && source ~/.bash/config_bash
[ -n "$PS1" ] && [[ -f ~/.bash/aliases_bash ]]       && source ~/.bash/aliases_bash
[ -n "$PS1" ] && [[ -f /usr/local/etc/bash_completion ]] && source /usr/local/etc/bash_completion
[ -n "$PS1" ] && [[ -r $NVM_DIR/bash_completion ]]       && source $NVM_DIR/bash_completion
