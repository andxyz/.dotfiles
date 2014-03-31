source ~/.shell/paths
source ~/.bash/config
source ~/.bash/aliases
source ~/.bash/completions

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc
