#!/usr/bin/env bash
#
# run this file with:
# `cd ~/code/andxyz-dotfiles && ./brew_install_stuff.sh`

set -x
set -e

rm -rf "$HOME/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins/Alcatraz.xcplugin"
rm -rf "$HOME/Library/Application\ Support/Alcatraz"
curl -fsSL 'https://raw.githubusercontent.com/alcatraz/Alcatraz/master/Scripts/install.sh' | sh
nohup /Applications/Xcode.app/Contents/MacOS/Xcode >/dev/null 2>&1 &
