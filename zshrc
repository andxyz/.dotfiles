source ~/.shell/paths

source ~/.shell/config
source ~/.shell/config_private
source ~/.shell/aliases

source ~/.zsh/config_zsh
source ~/.zsh/aliases_zsh

source ~/.zsh/completion_zsh

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc
