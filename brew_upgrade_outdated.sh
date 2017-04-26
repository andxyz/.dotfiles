#!/usr/bin/env bash
#
# upgrade all my outdated stuff
# run this file with:
# `cd ~/code/andxyz-dotfiles && ./brew_upgrade_outdated.sh`

set -x
set -e

### first off, update all brew meta data crap
## house cleaning round 1
brew update
brew cleanup -s && brew prune
brew cask cleanup

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
brew prune

# Show me what is out of date
IGNORE_LIST='go python virtualbox openssh openssl readline'
TO_UPDATE_LIST=$(gcomm -12 <(brew leaves | sort) <(brew outdated | sort))
TO_UPDATE_LIST_WITH_IGNORES=$(echo ${TO_UPDATE_LIST} | grep -v -i "${IGNORE_LIST}")

echo "${TO_UPDATE_LIST_WITH_IGNORES}"

brew upgrade ${TO_UPDATE_LIST_WITH_IGNORES} # update the packages
# brew cask list | # list the casks
# grep -v $IGNORE_LIST  | # skip these
# xargs brew cask install --force # update the cask stuff

## house cleaning round 2
brew cleanup -s
brew prune
brew doctor
brew cask cleanup
