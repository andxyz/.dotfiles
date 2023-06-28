#!/usr/bin/env bash
#
# upgrade all my outdated stuff
# run this file with:
# `cd ~/code/andxyz-dotfiles && ./brew_show_the_stuff_from_upgrade_outdated.sh`

# set -x
set -e

### first off, update all brew meta data crap
## house cleaning round 1

##
### house cleaning
##
function brew_run_a_cleanup() {
  brew cleanup -s
  # brew cask cleanup
}

# brew_run_a_cleanup()

##
### Cleanup all my random taps
##
#
# brew tap 'homebrew/aliases'
# brew tap 'homebrew/bundle'
# brew tap 'homebrew/services'
# brew tap 'universal-ctags/universal-ctags'
# brew tap 'samdmarshall/formulae'

# brew untap 'homebrew/apache' || true # was deprecated. This tap is now empty as all its formulae were migrated.
# brew untap 'homebrew/binary' || true # was deprecated. This tap is now empty as all its formulae were migrated.
# brew untap 'homebrew/completions' || true # was deprecated. This tap is now empty as all its formulae were migrated.
# brew untap 'homebrew/dupes' || true # was deprecated. This tap is now empty as all its formulae were migrated.
# brew untap 'homebrew/fuse' || true # was deprecated. This tap is now empty as all its formulae were migrated.
# brew untap 'homebrew/nginx' || true # was deprecated. This tap is now empty as all its formulae were migrated.
# brew untap 'homebrew/php' || true # was deprecated. This tap is now empty as all its formulae were migrated.
# brew untap 'homebrew/python' || true # was deprecated. This tap is now empty as all its formulae were migrated.
# brew untap 'homebrew/science' || true # was deprecated. This tap is now empty as all its formulae were migrated.
# brew untap 'homebrew/tex' || true # was deprecated. This tap is now empty as all its formulae were migrated.
# brew untap 'homebrew/versions' || true # was deprecated. This tap is now empty as all its formulae were migrated.
# brew untap 'josegonzalez/php' || true # was deprecated. for 'homebrew/php'
# brew untap 'homebrew/dev-tools' || true # was deprecated

# setup an ignore list
# note I pay for alfred and name-mangler casks, so I don't want the lastest
IGNORE_LIST="carthage
alfred
elastic/tap/elasticsearch-oss
elastic/tap/kibana-oss
ffmpeg
gnupg
gpg-agent
hunspell
imagemagick
imagemagick@6
mysql@5.5
mysql@5.6
mysql@5.7
mysql@5.8
name-mangler
ntfs-3g
openssh
openssl
openssl@1.1
openssl@3
postgresql
postgresql@9
postgresql@10
postgresql@11
postgresql@12
postgresql@13
postgresql@14
python
python@2
readline
virtualbox"

##
### Show me what is out of date
##
TO_UPDATE_LIST=$(gcomm -12 <(brew leaves | sort) <(brew outdated | sort))
echo "what brew knows needs updating:"
echo $TO_UPDATE_LIST
echo ""

TO_UPDATE_LIST_WITH_IGNORES=$(diff <(echo "$IGNORE_LIST" | sort | uniq) <(echo "$TO_UPDATE_LIST" | sort | uniq)  | grep ^\> | cut -d' ' -f2)

echo $TO_UPDATE_LIST_WITH_IGNORES

echo "here is the list a bit nicer"
echo ""

function small_ruby_program() {
cat << EOF
  list_to_update = \$stdin.read;

  list_to_update.split(" ").each do |upgradable_package|
    puts "brew upgrade '#{upgradable_package}'";
  end
EOF
}

echo $TO_UPDATE_LIST_WITH_IGNORES | ruby -e "$(small_ruby_program)"

##
### Final cleanup
##
# brew_run_a_cleanup()

# function todo_fix_me_update_the_cask_stuff() {
#   brew cask list | # list the casks
#   grep -v $IGNORE_LIST  # skip these
#
#
#   # xargs brew cask install --force # update the cask stuff
# }
