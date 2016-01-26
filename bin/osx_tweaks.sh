#!/usr/bin/env bash

set -ex

chflags nohidden ~/Library/
defaults write com.apple.screencapture name "screenshot"
mkdir $HOME/Pictures/_screenshots/
defaults write com.apple.screencapture location $HOME/Pictures/_screenshots/

# see https://github.com/mathiasbynens/dotfiles
# see https://github.com/sindresorhus/quick-look-plugins

exit 0
