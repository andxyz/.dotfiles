#!/usr/bin/env bash
#
# run this file with:
# `cd ~/code/andxyz-dotfiles && ./brew_reinstall_gnu_utils.sh`

set -x
set -e

brew uninstall 'findutils' --with-default-names &
brew uninstall 'gawk' --with-default-names &
brew uninstall 'gnu-indent' --with-default-names &
brew uninstall 'gnu-sed' --with-default-names &
brew uninstall 'gnu-tar' --with-default-names &
brew uninstall 'grep' --with-default-names &

brew cleanup -s
rm -rf $(brew --cache)

brew install 'findutils' &
brew install 'gawk' &
brew install 'gnu-indent' &
brew install 'gnu-sed' &
brew install 'gnu-tar' &
brew install 'grep' &

