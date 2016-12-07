#!/usr/bin/env bash

set -ex

# see https://github.com/mathiasbynens/dotfiles/blob/6d228f29a32e4c6f3593dceb563df1374a075978/.macos

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

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 25

# Enable full keyboard access for all controls (e.g. Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"
# Disable site favorites when focusing Safari’s URL bar
defaults write com.apple.Safari ShowFavoritesUnderSmartSearchField -bool false
# Disable preloading top hit in the background
defaults write com.apple.Safari PreloadTopHit -bool false
# Disable Quick Website Search
defaults write com.apple.Safari WebsiteSpecificSearchEnabled -bool false
# Stop Safari from offering to store passwords and credit card data
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillCreditCardData -bool false

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Configure iTerm2 to read preferences from Dropbox
# defaults write com.googlecode.iterm2 PrefsCustomFolder ~/Dropbox

exit 0
