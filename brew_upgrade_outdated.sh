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
brew cleanup -s

brew tap 'homebrew/aliases'
brew tap 'homebrew/bundle'
brew tap 'homebrew/dev-tools'
brew tap 'homebrew/services'
brew tap 'universal-ctags/universal-ctags'
brew tap 'samdmarshall/formulae'

brew untap 'homebrew/apache' || true # was deprecated. This tap is now empty as all its formulae were migrated.
brew untap 'homebrew/binary' || true # was deprecated. This tap is now empty as all its formulae were migrated.
brew untap 'homebrew/completions' || true # was deprecated. This tap is now empty as all its formulae were migrated.
brew untap 'homebrew/dupes' || true # was deprecated. This tap is now empty as all its formulae were migrated.
brew untap 'homebrew/fuse' || true # was deprecated. This tap is now empty as all its formulae were migrated.
brew untap 'homebrew/nginx' || true # was deprecated. This tap is now empty as all its formulae were migrated.
brew untap 'homebrew/php' || true # was deprecated. This tap is now empty as all its formulae were migrated.
brew untap 'homebrew/python' || true # was deprecated. This tap is now empty as all its formulae were migrated.
brew untap 'homebrew/science' || true # was deprecated. This tap is now empty as all its formulae were migrated.
brew untap 'homebrew/tex' || true # was deprecated. This tap is now empty as all its formulae were migrated.
brew untap 'homebrew/versions' || true # was deprecated. This tap is now empty as all its formulae were migrated.
brew untap 'josegonzalez/php' || true # was deprecated. for 'homebrew/php'

brew update
brew cleanup -s

# setup an ignore list
# note I pay for alfred and name-mangler casks, so I don't want the lastest
IGNORE_LIST="carthage
alfred
curl
ffmpeg
gnupg
go
gpg-agent
hunspell
imagemagick
imagemagick@6
mysql@5.5
mysql@5.6
mysql@5.7
name-mangler
ntfs-3g
openssh
openssl
postgresql@10
postgresql@10.10
postgresql@10.11
postgresql@10.6
postgresql@10.7
postgresql@10.8
postgresql@10.9
postgresql@11.1
postgresql@11.2
postgresql@11.3
postgresql@11.4
postgresql@11.5
postgresql@11.6
postgresql@9
postgresql@9.5
postgresql@9.6
python
python@2
readline
virtualbox"

# Show me what is out of date
TO_UPDATE_LIST=$(gcomm -12 <(brew leaves | sort) <(brew outdated | sort))
echo "what brew knows about:"
echo $TO_UPDATE_LIST

TO_UPDATE_LIST_WITH_IGNORES=$(diff <(echo "$IGNORE_LIST" | sort | uniq) <(echo "$TO_UPDATE_LIST" | sort | uniq)  | grep ^\> | cut -d' ' -f2)

echo "things I actually want to update:"
echo $TO_UPDATE_LIST_WITH_IGNORES

echo "$TO_UPDATE_LIST_WITH_IGNORES" | while read -r package_to_upgrade; do
  echo "brew upgrade ${package_to_upgrade}"
done

for PACKAGE_TO_UPGRADE in ${TO_UPDATE_LIST_WITH_IGNORES}; do
  echo "brew upgrade ${PACKAGE_TO_UPGRADE}"
done

update_the_cask_stuff() {
  brew cask list | # list the casks
  grep -v $IGNORE_LIST  | # skip these
  xargs brew cask install --force # update the cask stuff
}

## house cleaning round 2
brew_run_a_cleanup() {
  brew cleanup -s
  brew doctor
  brew cask cleanup
}

TO_UPDATE_LIST=$(gcomm -12 <(brew leaves | sort) <(brew outdated | sort))
echo "what brew knows needs updating:"
echo $TO_UPDATE_LIST
