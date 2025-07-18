# https://fishshell.com/docs/current/cmds/abbr.html

### ls
### Colorize the ls output
if command -q gls
    # do things for macOS
    abbr -a -- gls gls -F -h --group-directories-first --color=auto
    abbr -a -- gll gls -l -h --group-directories-first --color=auto
    abbr -a -- gla gls -A -h --group-directories-first --color=auto
end

if command -q eza
    # if eza is installed
    abbr -a -- ls eza -g --group-directories-first --color=auto --icons
    abbr -a -- ll eza -l --group-directories-first --color=auto --icons
    abbr -a -- la eza -g -a --group-directories-first --icons
end

if command -q git
    # ghostscript gs is the worst name for me
    abbr -a -- gs  git status --short --branch
    abbr -a -- gss git status --branch --find-renames
    abbr -a -- gco git checkout
end
