if status is-interactive
    test -d "$HOME/.cargo/bin" &&
        export PATH="$HOME/.cargo/bin:$PATH"

    # cargo install --locked zellij carapace starship git-delta eza zoxide

    #-----------
    # PATHS
    #-----------
    set -gx PATH  "$HOME/.local/bin" $PATH;

    # fisher install jorgebucaran/fisher

    # setup starship prompt
    # https://starship.rs/config/
    starship init fish | source

    # carapace-bin
    # https://carapace-sh.github.io/carapace-bin/carapace-bin.html
    # fisher install carapace-sh/carapace-bin

    # setup z command
    # https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#installation
    # zoxide init fish | source

    # setup fzf key bindings
    # https://github.com/junegunn/fzf?tab=readme-ov-file#setting-up-shell-integration
    # fzf --fish | source # note: needed fzf --version 0.64

    #-----------
    # Prompt
    #-----------
    # Do not show any greeting
    set --universal --erase fish_greeting
    function fish_greeting; end
    funcsave fish_greeting

    #-----------
    # Vars
    #-----------
    # Modify our path to include our Go binaries
    contains $HOME/code/go/bin $fish_user_paths; or set -Ua fish_user_paths $HOME/code/go/bin
    contains $HOME/bin $fish_user_paths; or set -Ua fish_user_paths $HOME/bin

    # Exported variables
    if isatty
        set -x GPG_TTY (tty)
    end

    # Editor
    set -gx EDITOR nvim

    #------------
    # Functions
    #------------
    # Shortcut to setup a nix-shell with fish. This lets you do something like
    # `fnix -p go` to get an environment with Go but use the fish shell along
    # with it.
    abbr -a fnix nix-shell --run fish
    abbr -a -- refish 'reset; exec env -i fish -li'

    # rbenv setup see ~/.rbenv/bin/rbenv init --help
    ~/.rbenv/bin/rbenv init - --no-rehash fish | source
end
