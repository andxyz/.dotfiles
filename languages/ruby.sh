#!/usr/bin/env bash
# curl -fsSL https://github.com/andxyz/.dotfiles/raw/master/languages/ruby.sh | bash
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

brew unlink openssl || true
brew unlink libffi || true
brew unlink libyaml || true
brew unlink readline || true

brew install openssl libyaml libffi readline
brew install libxml2 --with-xml2-config
brew install libxslt

brew link openssl --force || true
brew link libffi --force || true
brew link libyaml --force || true
brew link readline --force || true
brew link libxml2 --force || true
brew link libxslt --force || true

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

## make sure rbenv is uptodate
rbenv update

# required for building Ruby <= 1.9.3-p0:
# brew tap homebrew/dupes && brew install apple-gcc42

## install some rubies
echo '## installing rubies'
#
# rbenv install --list
## config.status: creating ruby-2.3.pc
##   CC = clang
##   LD = ld
##   LDSHARED = clang -dynamic -bundle
##   CFLAGS = -g2 -ggdb -O2 -O3 -Wno-error=shorten-64-to-32  -pipe
##   XCFLAGS = -D_FORTIFY_SOURCE=2 -fstack-protector -fno-strict-overflow -fvisibility=hidden -DRUBY_EXPORT
##   CPPFLAGS = -I/Users/andxyz/.rbenv/versions/2.3.1/include  -D_XOPEN_SOURCE -D_DARWIN_C_SOURCE -D_DARWIN_UNLIMITED_SELECT -D_REENTRANT   -I. -I.ext/include/x86_64-darwin14 -I./include -I.
##   DLDFLAGS = -Wl,-undefined,dynamic_lookup -Wl,-multiply_defined,suppress -fstack-protector -Wl,-u,_objc_msgSend -framework CoreFoundation
##   SOLIBS = -lgmp
export -- MAKE_OPT='-j8'
export -- CFLAGS='-g2 -ggdb -O2'
RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi" rbenv install --skip-existing --verbose 1.9.3-p551
RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi" rbenv install --skip-existing --verbose 2.2.5
RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi" rbenv install --skip-existing --verbose 2.3.1

# installer files cleanup
# cd /usr/local
# git checkout master
# git fetch origin
# git reset --hard origin/master
brew cleanup && brew prune
brew doctor

## set my default rubies for new shells
#
# rbenv shell 1.9.3-p547
# rbenv global 1.9.3-p547
# rbenv shell 2.2.4
# rbenv global 2.2.4
echo '## setting default shell ruby to 2.3.1'
rbenv shell  2.3.1
rbenv global 2.3.1

## show off my new whiz bangs! you guys! We gots whiz-bangs!
rbenv rehash
rbenv versions
## example use cases of some of our plugins

### update all your rubygems and bundlers on all your rubies
function update_ruby_stuff() {
  rbenv update
  rbenv each gem update --system
  rbenv each gem install bundler
  rbenv each gem update bundler
}
update_ruby_stuff;

### add some default gems for new ruby installs
# echo "bundler" >> $HOME/.rbenv/default-gems
# echo "pry" >> $HOME/.rbenv/default-gems
# echo "pry-byebug" >> $HOME/.rbenv/default-gems
# echo "interactive_editor" >> $HOME/.rbenv/default-gems
# echo "awesome_print" >> $HOME/.rbenv/default-gems
# echo "bcat" >> $HOME/.rbenv/default-gems
# echo "octodown" >> $HOME/.rbenv/default-gems
# echo "octokit" >> $HOME/.rbenv/default-gems
# echo "faraday" >> $HOME/.rbenv/default-gems
# echo "rest-client" >> $HOME/.rbenv/default-gems
#
# cat $HOME/.rbenv/default-gems

### check which rubies have a gem installed for it
# rbenv whence bundler

exit 0
