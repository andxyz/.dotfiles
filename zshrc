#!/usr/bin/env zsh

[[ -f ~/.shell/paths ]]             && source ~/.shell/paths
[[ -f ~/.shell/paths_private ]]     && source ~/.shell/paths_private
source ~/.zsh/paths

## generic shell configs
[[ -f ~/.shell/config ]]            && source ~/.shell/config
[[ -f ~/.shell/config_private ]]    && source ~/.shell/config_private
[[ -f ~/.shell/aliases ]]           && source ~/.shell/aliases
[[ -f ~/.shell/aliases_private ]]   && source ~/.shell/aliases_private
[[ -f ~/.shell/functions ]]         && source ~/.shell/functions
[[ -f ~/.shell/functions_private ]] && source ~/.shell/functions_private
[[ -f ~/.shell/zsh_functions_private ]] && source ~/.shell/zsh_functions_private

## zsh specific
[[ -f ~/.zsh/config_zsh ]]          && source ~/.zsh/config_zsh
[[ -f ~/.zsh/aliases_zsh ]]         && source ~/.zsh/aliases_zsh
[[ -f ~/.zsh/completion_zsh ]]      && source ~/.zsh/completion_zsh

## use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc
