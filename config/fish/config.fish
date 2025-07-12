if status is-interactive
    test -d "$HOME/.cargo/bin" &&
        export PATH="$HOME/.cargo/bin:$PATH"

    # starship
    # https://github.com/starship/starship

    # carapace-bin
    # https://carapace-sh.github.io/carapace-bin/carapace-bin.html

    # fisher install jorgebucaran/fisher
    # fisher install carapace-sh/carapace-bin

    # setup starship prompt
    # https://starship.rs/config/
    starship init fish | source

    # setup z command
    # https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#installation
    zoxide init fish | source

    # setup fzf key bindings 
    # https://github.com/junegunn/fzf?tab=readme-ov-file#setting-up-shell-integration
    fzf --fish | source # note: needed fzf --version 0.64

    # cargo install --locked zellij carapace starship git-delta eza
end
