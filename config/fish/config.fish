if status is-login
    # # TODO: make it work
    # # forcing paths on a mac
    # set PATH '/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin'

    # # # env shell configs
    source ~/.shell/shell_envs
    # test -f ~/.shell/path_envs         && bass source ~/.shell/path_envs
    # test -f ~/.shell/path_envs_private && bass source ~/.shell/path_envs_private
    # test -f ~/.shell/config_ruby_envs  && bass source ~/.shell/config_ruby_envs

    # # ## env fish specific
    # # ## TODO

    # # ## env for docker
    # test -f ~/.profile                 && bass source ~/.profile

    # # ## env for private vars
    # test -f ~/.profile_pilot_private   && bass source ~/.profile_pilot_private
    # test -f ~/.profile_wonolo_private  && bass source ~/.profile_wonolo_private

    # source_rustup_env
end

if status is-interactive
    #-----------
    # PATHS
    #-----------
    test -d "$HOME/.cargo/bin" && export PATH="$HOME/.cargo/bin:$PATH"
    set -gx PATH  "$HOME/.local/bin" $PATH;

    # cargo install --locked zellij starship git-delta eza zoxide
    # brew tap rsteube/homebrew-tap
    # brew install rsteube/tap/carapace
    set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
    # fisher install carapace-sh/carapace-bin
    # fisher install jorgebucaran/fisher

    # setup starship prompt
    # https://starship.rs/config/
    starship init fish | source

    # setup z command
    # https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#installation
    zoxide init fish | source

    # setup fzf key bindings
    # https://github.com/junegunn/fzf?tab=readme-ov-file#setting-up-shell-integration
    # fzf --fish | source # note: needed fzf --version 0.64

    #-----------
    # Prompt
    #-----------
    # Do not show any greeting
    set --universal --erase fish_greeting
    function fish_greeting;end
    funcsave --quiet fish_greeting

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
    abbr -a -- fnix nix-shell --run fish
    set -gx TERM_DIRS "$HOME/.terminfo:/opt/local/share/terminfo:/usr/share/terminfo"
    # brew install ncurses
    # cd /usr/local/opt/ncurses/bin
    # mkdir -p ~/.terminfo/
    # cd ~/.terminfo/
    # sudo /usr/local/opt/ncurses/bin/infocmp -x | /usr/local/opt/ncurses/bin/tic -x - > xterm-ghostty.terminfo

    # rbenv setup
    # ~/.rbenv/bin/rbenv init --help
    ~/.rbenv/bin/rbenv init - --no-rehash fish | source

    # For codde editors to have access to linters and autocomplete
    launchctl setenv PATH "$PATH"
end
