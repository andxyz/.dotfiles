source ~/.shell/paths

## generic shell configs
[[ -f ~/.shell/config ]]            && source ~/.shell/config
[[ -f ~/.shell/config_private ]]    && source ~/.shell/config_private
[[ -f ~/.shell/aliases ]]           && source ~/.shell/aliases
[[ -f ~/.shell/aliases_private ]]   && source ~/.shell/aliases_private
[[ -f ~/.shell/functions ]]         && source ~/.shell/functions
[[ -f ~/.shell/functions_private ]] && source ~/.shell/functions_private

## zsh specific
source ~/.zsh/config_zsh
source ~/.zsh/aliases_zsh

source ~/.zsh/completion_zsh

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc
