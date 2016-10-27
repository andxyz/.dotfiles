#!/usr/bin/env bash
#
# upgrade all my outdated stuff
# run this file with:
# `cd ~/code/andxyz-dotfiles && ./brew_upgrade_outdated.sh`

set -x
set -e

IGNORE_LIST='haskell-stack cabal-install go php56 python virtualbox'
### first off, update all brew meta data crap

## house cleaning round 1
brew update
brew cleanup -s
brew cask cleanup
brew prune

brew tap 'homebrew/aliases'
brew tap 'homebrew/apache'
brew tap 'homebrew/binary'
brew tap 'homebrew/bundle'
brew tap 'homebrew/completions'
brew tap 'homebrew/dev-tools'
brew tap 'homebrew/dupes'
brew tap 'homebrew/fuse'
brew tap 'homebrew/php'
brew tap 'homebrew/python'
brew tap 'homebrew/nginx'
brew tap 'homebrew/science'
brew tap 'homebrew/services'
brew tap 'homebrew/tex'
brew tap 'homebrew/versions'
brew tap 'universal-ctags/universal-ctags'
brew tap 'samdmarshall/formulae'
brew untap 'josegonzalez/php'

brew update
brew cleanup -s

brew outdated # show the old
brew upgrade $(brew outdated --full-name | grep -v $IGNORE_LIST) # update the packages
brew cask list | # list the casks
grep -v $IGNORE_LIST  | # skip these
xargs brew cask install --force # update the cask stuff

## house cleaning round 2
brew cleanup -s && brew prune
brew doctor
brew cask cleanup
