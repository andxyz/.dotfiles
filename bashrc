#!/usr/bin/env bash
# set -x
# set -e

# forcing paths on a mac when using interactive shell
export -- PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
[[ -f ~/.shell/path_envs ]]         && source ~/.shell/path_envs
[[ -f ~/.shell/path_envs_private ]] && source ~/.shell/path_envs_private

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
[ -n "$PS1" ] && [[ -f ~/.bash/bash_aliases ]]           && source ~/.bash/bash_aliases
[ -n "$PS1" ] && [[ -f ~/.bash/bash_completion ]]        && source ~/.bash/bash_completion
[ -n "$PS1" ] && [[ -f ~/.bash/bash_functions_private ]] && source ~/.bash/bash_functions_private
[ -n "$PS1" ] && [[ -f ~/.bash/bash_interactive ]]       && source ~/.bash/bash_interactive
[ -n "$PS1" ] && [[ -f /usr/local/etc/bash_completion ]] && source /usr/local/etc/bash_completion
