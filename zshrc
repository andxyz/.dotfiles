source ~/.shell/paths
source ~/.zsh/config
source ~/.zsh/aliases
source ~/.zsh/completion

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc
