source ~/.shell/paths

source ~/.shell/config
source ~/.shell/config_private
source ~/.shell/aliases

source ~/.bash/config_bash
source ~/.bash/aliases_bash

source ~/.bash/completions_bash

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc
