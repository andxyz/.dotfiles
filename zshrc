#!/usr/bin/env zsh
# set -x
# set -e

# forcing paths on a mac
export -- PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
[[ -f ~/.shell/path_envs ]]         && source ~/.shell/path_envs

## for interactive shell
[ -n "$PS1" ] && [[ -f ~/.shell/config_interactive_shell ]]   && source ~/.shell/config_interactive_shell
[ -n "$PS1" ] && [[ -f ~/.shell/config_interactive_private ]] && source ~/.shell/config_interactive_private
[[ -f ~/.shell/config_ssh_agent ]]  && source ~/.shell/config_ssh_agent
[[ -f ~/.shell/aliases ]]           && source ~/.shell/aliases
[[ -f ~/.shell/aliases_private ]]   && source ~/.shell/aliases_private
[[ -f ~/.shell/functions ]]         && source ~/.shell/functions
[[ -f ~/.shell/functions_private ]] && source ~/.shell/functions_private
[[ -f ~/.shell/ruby_rails_tricks.sh ]] && source ~/.shell/ruby_rails_tricks.sh

## for zsh interactive specific
[ -n "$PS1" ] && [[ -f ~/.zsh/zsh_interactive ]]     && source ~/.zsh/zsh_interactive
[ -n "$PS1" ] && [[ -f ~/.zsh/zsh_completion ]]      && source ~/.zsh/zsh_completion
[ -n "$PS1" ] && [[ -f ~/.zsh/zsh_functions_private ]] && source ~/.zsh/zsh_functions_private

echo \
"""export -- PATH=
$PATH"""
