if command -q eza
    abbr -a ll eza -l --icons
    abbr -a ls eza -g --icons
    abbr -a la eza -g -a --icons
end

if command -q git
    abbr -a gs git status
end
