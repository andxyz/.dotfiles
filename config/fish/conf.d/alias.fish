# https://fishshell.com/docs/current/cmds/alias.html

alias ddouble_rainbow.sh='double_rainbow.sh'

### ls
### Colorize the ls output
### do things for macOS
alias gls='gls -F -h --group-directories-first --color=auto'
alias gll='gls -l -h --group-directories-first --color=auto'
alias gla='gls -A -h --group-directories-first --color=auto'

### eza
alias ls='eza -g --group-directories-first --color=auto --icons'
alias ll='eza -l --group-directories-first --color=auto --icons'
alias la='eza -g -a --group-directories-first --icons'

alias refish='exec env -i -- TERM=xterm-ghostty /usr/local/bin/fish --login --interactive'

## ctags
alias cctags='cctags.sh &'

### rails and ruby
## alias bi="bundle install --binstubs"
alias bi='bundle check || bundle install'
alias be='bundle exec'

### test internet with speedtest
##### python peeps checkout https://github.com/sivel/speedtest-cli
##### tips thanks to http://fauxzen.com/speedtest-from-the-cli/
alias sspeedtest='echo "scale=2; `curl  --progress-bar -w "%{speed_download}" http://cachefly.cachefly.net/10mb.test -o test.zip ` / 131072" | bc | xargs -I {} echo {}Mb\/s && rm -rf test.zip'
