#!/usr/bin/env zsh

[[ -f ~/.shell/paths ]]             && source ~/.shell/paths
[[ -f ~/.shell/paths_private ]]     && source ~/.shell/paths_private

## generic shell configs
[[ -f ~/.shell/config ]]            && source ~/.shell/config
[[ -f ~/.shell/config_private ]]    && source ~/.shell/config_private
[[ -f ~/.shell/aliases ]]           && source ~/.shell/aliases
[[ -f ~/.shell/aliases_private ]]   && source ~/.shell/aliases_private
[[ -f ~/.shell/functions ]]         && source ~/.shell/functions
[[ -f ~/.shell/functions_private ]] && source ~/.shell/functions_private
[[ -f ~/.shell/ruby_rails_tricks.sh ]] && source ~/.shell/ruby_rails_tricks.sh
[[ -f ~/.shell/zsh_functions_private ]] && source ~/.shell/zsh_functions_private

## zsh specific
[[ -f ~/.zsh/config_zsh ]]          && source ~/.zsh/config_zsh
[[ -f ~/.zsh/completion_zsh ]]      && source ~/.zsh/completion_zsh
[[ -f ~/.shell/paths_zsh ]]         && source ~/.zsh/paths_zsh

## use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc
