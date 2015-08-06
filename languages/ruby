#!/usr/bin/env bash
# curl -fsSL https://github.com/andxyz/.dotfiles/raw/master/languages/ruby | bash
set -xe

## see https://github.com/sstephenson/rbenv/wiki/_pages
echo '## installing rbenv'
git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
export -- PATH="$HOME/.rbenv/bin:$PATH" &&
eval "$(rbenv init -)"

# optional, but recommended:
# https://github.com/sstephenson/ruby-build/wiki#suggested-build-environment
echo '## installing recommended homebrew dependencies'
brew update
brew unlink libyaml || true
brew install openssl libyaml libffi
brew link libyaml || true

## plugins ahoy, see https://github.com/sstephenson/rbenv/wiki/Plugins
echo '## installing rbenv plugins'
mkdir $HOME/.rbenv/plugins/
git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
git clone https://github.com/rbenv/rbenv-each.git $HOME/.rbenv/plugins/rbenv-each
git clone https://github.com/rkh/rbenv-update.git $HOME/.rbenv/plugins/rbenv-update
git clone https://github.com/sstephenson/rbenv-gem-rehash.git $HOME/.rbenv/plugins/rbenv-gem-rehash
git clone https://github.com/sstephenson/rbenv-default-gems.git $HOME/.rbenv/plugins/rbenv-default-gems

ls "$(rbenv root)"/plugins

## prepare ruby-build, see https://github.com/sstephenson/ruby-build/wiki
cd "$(rbenv root)"/plugins/ruby-build && git pull
cd $HOME

# required for building Ruby <= 1.9.3-p0:
# brew tap homebrew/dupes && brew install apple-gcc42

## install some rubies
echo '## installing rubies'
#
# rbenv install --list
# rbenv install --skip-existing --verbose 1.8.7-p375
# rbenv install --skip-existing --verbose 1.9.3-p448
# rbenv install --skip-existing --verbose 2.0.0-p481
# rbenv install --skip-existing --verbose jruby-1.7.16.1
# rbenv install --skip-existing --verbose jruby-1.7.20
rbenv install --skip-existing --verbose 1.9.3-p551
rbenv install --skip-existing --verbose 2.1.5
rbenv install --skip-existing --verbose 2.2.1
rbenv install --skip-existing --verbose 2.2.2

## set my default rubies for new shells
#
# rbenv shell 1.9.3-p547
# rbenv global 1.9.3-p547
# rbenv shell 2.2.0
echo '## setting default shell ruby to 2.2.2'
rbenv global 2.2.2

## show off my new whiz bangs! you guys! We gots whiz-bangs!
rbenv rehash
rbenv versions

## example use cases of some of our plugins

### update all your rubygems and bundlers on all your rubies
# rbenv update
# rbenv each gem update --system
# rbenv each gem update bundler

### add some default gems for new ruby installs
# echo "bundler" >> $HOME/.rbenv/default-gems
# echo "pry" >> $HOME/.rbenv/default-gems
# echo "bcat" >> $HOME/.rbenv/default-gems
# echo "octodown" >> $HOME/.rbenv/default-gems

### check which rubies have a gem installed for it
# rbenv whence bundler

exit 0
