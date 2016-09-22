#!/usr/bin/env zsh
# set -x
# set -e

## for interactive shell
[[ -f ~/.shell/config_interactive_shell ]]   && source ~/.shell/config_interactive_shell
[[ -f ~/.shell/config_interactive_private ]] && source ~/.shell/config_interactive_private
[[ -f ~/.shell/config_ssh_agent ]]  && source ~/.shell/config_ssh_agent
[[ -f ~/.shell/aliases ]]           && source ~/.shell/aliases
[[ -f ~/.shell/aliases_private ]]   && source ~/.shell/aliases_private
[[ -f ~/.shell/functions ]]         && source ~/.shell/functions
[[ -f ~/.shell/functions_private ]] && source ~/.shell/functions_private
[[ -f ~/.shell/ruby_rails_tricks.sh ]] && source ~/.shell/ruby_rails_tricks.sh

## for zsh interactive specific
[[ -f ~/.zsh/zsh_interactive ]]     && source ~/.zsh/zsh_interactive
[[ -f ~/.zsh/zsh_completion ]]      && source ~/.zsh/zsh_completion
[[ -f ~/.zsh/zsh_functions_private ]] && source ~/.zsh/zsh_functions_private
