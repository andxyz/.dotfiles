#!/usr/bin/env bash

set -ex

# see https://github.com/mathiasbynens/dotfiles/blob/master/.macos

# Show the ~/Library folder
sudo chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Save screenshots to the desktop
mkdir ${HOME}/Pictures/_screenshots/
defaults write com.apple.screencapture location -string "${HOME}/Pictures/_screenshots/"

# Set screenshots name
defaults write com.apple.screencapture name "screenshot"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

exit 0
