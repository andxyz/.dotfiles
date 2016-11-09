#!/usr/bin/env bash
#
## run this file with:
##
## ```shell
## cd ~/code/andxyz-dotfiles
## ./brew_install_stuff.sh
## xcode-select --install
## ./xcode_install_stuff.sh
## ```

#set -x
#set -e

## reinstall alcatrax plugin package manager
#rm -rf "$HOME/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins/Alcatraz.xcplugin"
#rm -rf "$HOME/Library/Application\ Support/Alcatraz"
#curl --silent --show-error --fail --location 'https://raw.githubusercontent.com/alcatraz/Alcatraz/master/Scripts/install.sh' | sh

## now boot xcode
#nohup /Applications/Xcode.app/Contents/MacOS/Xcode >/dev/null 2>&1 &

## ls $HOME/Library/Application\ Support/Alcatraz/Plug-ins
## Alcatraz  ClangFormat  FixCode  FuzzyAutocomplete  JSFormatter  NJHMultiTheme

## ls $HOME/Library/Application\ Support/Alcatraz/FontAndColorThemes
## Base16 Ocean  BladeRunner  Colorswift  Dark Flatten Theme  Monokai  Monokai Revisited  One Dark for Xcode  Seti  Tomorrow Night (Bright)  Twilight  fruits

## NJHMultiTheme https://github.com/nathanhosselton/NJHMultiTheme
