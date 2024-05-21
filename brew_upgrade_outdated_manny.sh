#!/usr/bin/env bash
set -x

set -eufo pipefail

# May 2024

brew upgrade 'ack'
brew upgrade 'advancecomp'
brew upgrade 'automake'
brew upgrade 'bash-completion@2'
brew upgrade 'clang-format'
brew upgrade 'cmake'
brew upgrade 'coreutils'
brew upgrade 'cppcheck'
brew upgrade 'diffutils'
brew upgrade 'findutils'
brew upgrade 'gawk'
brew upgrade 'gem-completion'
brew upgrade 'gh'
brew upgrade 'gifsicle'
brew upgrade 'git'
brew upgrade 'git-delta'
brew upgrade 'gnu-indent'
brew upgrade 'gnu-sed'
brew upgrade 'gnu-tar'
brew upgrade 'gradle'
brew upgrade 'grep'
brew upgrade 'gzip'
brew upgrade 'highlight'
brew upgrade 'ical-buddy'
brew upgrade 'jenv'
brew upgrade 'jhead'
brew upgrade 'jonof/kenutils/pngout'
brew upgrade 'jpegoptim'
brew upgrade 'jq'
brew upgrade 'leiningen'
brew upgrade 'libiconv'
brew upgrade 'libimobiledevice'
brew upgrade 'libmpc'
brew upgrade 'libxslt'
brew upgrade 'mas'
brew upgrade 'moreutils'
brew upgrade 'optipng'
brew upgrade 'p7zip'
brew upgrade 'pngquant'
brew upgrade 'pstree'
brew upgrade 'ripgrep'
brew upgrade 'rs/tap/curlie'
brew upgrade 'rsync'
brew upgrade 'sassc'
brew upgrade 'shellcheck'
brew upgrade 'tree'
brew upgrade 'z'
brew upgrade 'zsh'

brew upgrade 'htop'
sudo chown root:wheel `which htop`
sudo chmod u+s `which htop`


brew cleanup -s
rm -rf $(brew --cache)

# # Dec feb 27 2021

# brew uninstall 'go@1.11'
# brew uninstall 'go@1.9'
# brew uninstall 'httrack'
# brew uninstall 'ios-webkit-debug-proxy'
# brew uninstall 'iperf'
# brew uninstall 'cmus'

# brew uninstall 'django-completion'
# brew uninstall 'docker-machine-completion'
# brew uninstall 'docker-machine'

# ## slow to update
# brew upgrade 'gifsicle'
# brew upgrade 'git'
# brew upgrade 'zsh'
# brew upgrade 'cmake'
# brew uninstall 'gcc@6'
# brew upgrade 'gdb'
# brew upgrade 'ghostscript'
# brew upgrade 'gradle'
# brew upgrade 'youtube-dl'
# brew upgrade 'awscli'


# ## got here, osx10.3 is unsupported by homebrew lots of unbottled things being compiled.
# ## was Time to update I guess.

# # I upgraded to osx10.5.7

# # brew upgrade 'advancecomp'
# # brew upgrade 'automake'

# brew upgrade 'ack'
# brew upgrade 'bash-completion@2'
# brew upgrade 'binutils'
# brew upgrade 'clang-format'
# brew upgrade 'coreutils'
# brew upgrade 'cppcheck'
# brew upgrade 'curl'
# brew upgrade 'diffutils'

# brew upgrade 'docker-completion'
# brew upgrade 'docker-compose-completion'
# brew upgrade 'findutils'
# brew upgrade 'fzf'
# brew upgrade 'gawk'

# brew upgrade 'gnu-indent'
# brew upgrade 'gnu-sed'
# brew upgrade 'gnu-tar'
# brew upgrade 'gnutls'
# brew upgrade 'grep'
# brew upgrade 'gzip'
# brew upgrade 'highlight'
# brew upgrade 'htop'
# brew upgrade 'httpie'

# brew upgrade 'ical-buddy'
# brew upgrade 'jenv'
# brew upgrade 'jhead'
# brew upgrade 'jonof/kenutils/pngout'
# brew upgrade 'jpegoptim'
# brew upgrade 'jq'
# brew upgrade 'leiningen'
# brew upgrade 'less'

# brew upgrade 'macvim'
# brew upgrade 'mas'
# brew upgrade 'moreutils'
# brew upgrade 'p7zip'
# # brew upgrade 'parallel'

# brew upgrade 'pipenv'
# brew upgrade 'pngquant'
# brew upgrade 'qcachegrind'
# brew upgrade 'reattach-to-user-namespace'
# brew upgrade 'ripgrep'
# brew upgrade 'rs/tap/curlie'
# brew upgrade 'rsync'
# brew upgrade 'sassc'
# brew upgrade 'terraform'
# brew upgrade 'tmux'

# brew upgrade 'tree'
# brew upgrade 'wget'
# brew upgrade 'zsh-completions'
# brew upgrade 'zsh-syntax-highlighting'

# brew cleanup -s
# rm -rf $(brew --cache)

# # mactex (20170524) != 2020.0407
