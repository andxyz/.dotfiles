#!/usr/bin/env bash
# curl -fsSL https://github.com/andxyz/.dotfiles/raw/master/languages/ruby.sh | bash
# source ~/code/andxyz-dotfiles/languages/ruby.sh
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
# brew tap 'homebrew/dupes' && brew install 'apple-gcc42'

## install some rubies
echo '## installing rubies'
#
# ---
# Configuration summary for ruby version 2.4.0

#    * Installation prefix: /Users/andxyz/.rbenv/versions/2.4.0
#    * exec prefix:         ${prefix}
#    * arch:                x86_64-darwin15
#    * site arch:           ${arch}
#    * RUBY_BASE_NAME:      ruby
#    * ruby lib prefix:     ${libdir}/${RUBY_BASE_NAME}
#    * site libraries path: ${rubylibprefix}/${sitearch}
#    * vendor path:         ${rubylibprefix}/vendor_ruby
#    * target OS:           darwin15
#    * compiler:            clang
#    * with pthread:        yes
#    * enable shared libs:  no
#    * dynamic library ext: bundle
#    * CFLAGS:              ${optflags} ${debugflags} ${warnflags}
#    * LDFLAGS:             -L. -L/Users/andxyz/.rbenv/versions/2.4.0/lib  \
#                           -fstack-protector -L/usr/local/lib
#    * optflags:            -O3 -fno-fast-math
#    * debugflags:          -ggdb3
#    * warnflags:           -Wall -Wextra -Wno-unused-parameter \
#                           -Wno-parentheses -Wno-long-long \
#                           -Wno-missing-field-initializers \
#                           -Wno-tautological-compare \
#                           -Wno-parentheses-equality \
#                           -Wno-constant-logical-operand -Wno-self-assign \
#                           -Wunused-variable -Wimplicit-int -Wpointer-arith \
#                           -Wwrite-strings -Wdeclaration-after-statement \
#                           -Wshorten-64-to-32 \
#                           -Wimplicit-function-declaration \
#                           -Wdivision-by-zero -Wdeprecated-declarations \
#                           -Wextra-tokens
#    * strip command:       strip -A -n
#    * install doc:         no
#    * man page type:       doc
#   CC = clang
#   LD = ld
#   LDSHARED = clang -dynamic -bundle
#   CFLAGS = -g2 -ggdb -O3 -O3 -Wno-error=shorten-64-to-32  -pipe
#   XCFLAGS = -D_FORTIFY_SOURCE=2 -fstack-protector -fno-strict-overflow -fvisibility=hidden -DRUBY_EXPORT -fPIE
#   CPPFLAGS = -I/Users/andxyz/.rbenv/versions/2.4.0/include  -D_XOPEN_SOURCE -D_DARWIN_C_SOURCE -D_DARWIN_UNLIMITED_SELECT -D_REENTRANT   -I. -I.ext/include/x86_64-darwin15 -I./include -I. -I./enc/unicode/9.0.0
#   DLDFLAGS = -L/Users/andxyz/.rbenv/versions/2.4.0/lib  -Wl,-undefined,dynamic_lookup -Wl,-multiply_defined,suppress -fstack-protector -Wl,-u,_objc_msgSend -Wl,-pie -framework CoreFoundation
#   SOLIBS = -lgmp
# Apple LLVM version 8.0.0 (clang-800.0.42.1)
# installing binary commands:   /Users/andxyz/.rbenv/versions/2.4.0/bin
# installing base libraries:    /Users/andxyz/.rbenv/versions/2.4.0/lib
# installing arch files:        /Users/andxyz/.rbenv/versions/2.4.0/lib/ruby/2.4.0/x86_64-darwin15
# installing pkgconfig data:    /Users/andxyz/.rbenv/versions/2.4.0/lib/pkgconfig
# installing command scripts:   /Users/andxyz/.rbenv/versions/2.4.0/bin
# installing library scripts:   /Users/andxyz/.rbenv/versions/2.4.0/lib/ruby/2.4.0
# installing common headers:    /Users/andxyz/.rbenv/versions/2.4.0/include/ruby-2.4.0
# installing manpages:          /Users/andxyz/.rbenv/versions/2.4.0/share/man/man1
# installing extension objects: /Users/andxyz/.rbenv/versions/2.4.0/lib/ruby/2.4.0/x86_64-darwin15
# installing extension objects: /Users/andxyz/.rbenv/versions/2.4.0/lib/ruby/site_ruby/2.4.0/x86_64-darwin15
# installing extension objects: /Users/andxyz/.rbenv/versions/2.4.0/lib/ruby/vendor_ruby/2.4.0/x86_64-darwin15
# installing extension headers: /Users/andxyz/.rbenv/versions/2.4.0/include/ruby-2.4.0/x86_64-darwin15
# installing extension scripts: /Users/andxyz/.rbenv/versions/2.4.0/lib/ruby/2.4.0
# installing extension scripts: /Users/andxyz/.rbenv/versions/2.4.0/lib/ruby/site_ruby/2.4.0
# installing extension scripts: /Users/andxyz/.rbenv/versions/2.4.0/lib/ruby/vendor_ruby/2.4.0
# installing extension headers: /Users/andxyz/.rbenv/versions/2.4.0/include/ruby-2.4.0/ruby
# installing default gems:      /Users/andxyz/.rbenv/versions/2.4.0/lib/ruby/gems/2.4.0

# if you can find the new version maybe rbenv needs an update...
# rbenv update
# rbenv install --list
env -- MAKE_OPT='-j8' CFLAGS='-g2 -ggdb -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi" rbenv install --skip-existing --verbose 1.9.3-p551
env -- MAKE_OPT='-j8' CFLAGS='-g2 -ggdb -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi" rbenv install --skip-existing --verbose 2.2.6
env -- MAKE_OPT='-j8' CFLAGS='-g2 -ggdb -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.3.4
env -- MAKE_OPT='-j8' CFLAGS='-g2 -ggdb -O3' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.3.5
env -- MAKE_OPT='-j8' CFLAGS='-g2 -ggdb -O3' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.4.1


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
# rbenv shell 2.2.6
# rbenv global 2.2.6
# rbenv shell  2.3.4
# rbenv global 2.3.4
echo '## setting default shell ruby to 2.4.1'
rbenv shell  2.4.1
rbenv global 2.4.1

## show off my new whiz bangs! you guys! We gots whiz-bangs!
rbenv rehash
rbenv versions
## example use cases of some of our plugins

### update all your rubygems and bundlers on all your rubies
function update_rubygems_bundler_for_rbenv_all() {
  rbenv update
  rbenv each gem update --system
  rbenv each gem install bundler
  rbenv each gem update bundler
}
update_rubygems_bundler_for_rbenv_all;


function update_rubygems_bundler_for_rbenv_local() {
  rbenv exec gem update --system
  rbenv exec gem install bundler
  rbenv exec gem update bundler
  rbenv exec gem list | grep bundler
}
# update_rubygems_bundler_for_rbenv_local;

# eventmachine openssl issues
# bundle config --global build.eventmachine --with-cppflags=-I$(brew --prefix openssl)/include

### add some default gems for new ruby installs
# echo "bundler" >> $HOME/.rbenv/default-gems
# echo "pry" >> $HOME/.rbenv/default-gems
# echo "pry-byebug" >> $HOME/.rbenv/default-gems
# echo "pry-doc" >> $HOME/.rbenv/default-gems
# echo "yard" >> $HOME/.rbenv/default-gems

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
# rbenv exec gem uninstall bundler -v '1.15.0'
# rbenv exec gem install bundler -v '1.14.6'

exit 0
