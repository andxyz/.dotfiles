source ~/.shell/paths

## generic shell configs
[[ -f ~/.shell/config ]]            && source ~/.shell/config
[[ -f ~/.shell/config_private ]]    && source ~/.shell/config_private
[[ -f ~/.shell/aliases ]]           && source ~/.shell/aliases
[[ -f ~/.shell/aliases_private ]]   && source ~/.shell/aliases_private
[[ -f ~/.shell/functions ]]         && source ~/.shell/functions
[[ -f ~/.shell/functions_private ]] && source ~/.shell/functions_private

## bash specific
source ~/.bash/config_bash
source ~/.bash/aliases_bash
source /usr/local/etc/bash_completion

## use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc
