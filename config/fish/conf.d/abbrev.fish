# https://fishshell.com/docs/current/cmds/abbr.html

if command -q git
    # ghostscript gs is the worst name for me
    abbr -a -- gs  git status --short --branch
    abbr -a -- gss git status --branch --find-renames
    abbr -a -- gco git checkout
end
