if status is-interactive
    test -d "$HOME/.cargo/bin" &&
        export PATH="$HOME/.cargo/bin:$PATH"

    # starship
    # https://github.com/starship/starship

    # carapace-bin
    # https://carapace-sh.github.io/carapace-bin/carapace-bin.html

    # fisher install jorgebucaran/fisher
    # fisher install tyler-stefani/starship
    # fisher install carapace-sh/carapace-bin

    # cargo install --locked zellij carapace starship git-delta
end
