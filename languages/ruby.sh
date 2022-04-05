#!/usr/bin/env bash
#
# curl -fsSL https://github.com/andxyz/.dotfiles/raw/master/languages/ruby.sh | bash
# source ~/code/andxyz-dotfiles/languages/ruby.sh
#
# `shellcheck /Users/andrew/code/andxyz-dotfiles/languages/ruby.sh`
#
set -x
set -e

## see https://github.com/rbenv/rbenv/wiki/_pages
echo '## installing rbenv'
git clone https://github.com/rbenv/rbenv.git "${HOME}"/.rbenv
export -- PATH="${HOME}/.rbenv/bin:$PATH" &&
eval "$(rbenv init -)"

# optional, but recommended:
# https://github.com/rbenv/ruby-build/wiki#suggested-build-environment
echo '## installing recommended homebrew dependencies'
brew update

XYZ_DEFAULT_RUBY="2.7.5"

brew unlink openssl  || true
brew unlink libffi   || true
brew unlink libyaml  || true
brew unlink readline || true

(brew install openssl  && brew upgrade openssl)  || true
(brew install libffi   && brew upgrade libffi)   || true
(brew install libyaml  && brew upgrade libyaml)  || true
(brew install readline && brew upgrade readline) || true
(brew install libxml2  && brew upgrade libxml2)  || true
(brew install libxslt  && brew upgrade libxslt)  || true
(brew install postgresql@11  && brew upgrade postgresql@11)  || true

brew link openssl --force || true
brew link libffi --force || true
brew link libyaml --force || true
brew link readline --force || true
brew link libxml2 --force || true
brew link libxslt --force || true

export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib -L/usr/local/opt/libffi/lib -L/usr/local/opt/readline/lib -L/usr/local/opt/libxml2/lib -L/usr/local/opt/libxslt/lib -L/usr/local/opt/postgresql@11/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include -I/usr/local/opt/libffi/include -I/usr/local/opt/readline/include -I/usr/local/opt/libxml2/include -I/usr/local/opt/libxslt/include -I/usr/local/opt/postgresql@11/include"

## plugins ahoy, see https://github.com/rbenv/rbenv/wiki/Plugins
echo '## installing rbenv plugins'
mkdir "${HOME}"/.rbenv/plugins/
git clone https://github.com/rbenv/ruby-build.git "${HOME}"/.rbenv/plugins/ruby-build
git clone https://github.com/rbenv/rbenv-each.git "${HOME}"/.rbenv/plugins/rbenv-each
git clone https://github.com/rkh/rbenv-update.git "${HOME}"/.rbenv/plugins/rbenv-update
git clone https://github.com/rbenv/rbenv-gem-rehash.git "${HOME}"/.rbenv/plugins/rbenv-gem-rehash
git clone https://github.com/rbenv/rbenv-default-gems.git "${HOME}"/.rbenv/plugins/rbenv-default-gems

ls "$(rbenv root)"/plugins

## prepare ruby-build, see https://github.com/rbenv/ruby-build/wiki
cd "$(rbenv root)"/plugins/ruby-build && git pull
cd -

## make sure rbenv is uptodate
rbenv update

# required for building Ruby <= 1.9.3-p0:
# brew tap 'homebrew/dupes' && brew install 'apple-gcc42'

## install some rubies
echo '## installing rubies'
#
# ---
# Configuration summary for ruby version 2.4.4
#
#    * Installation prefix: /Users/andxyz/.rbenv/versions/2.4.4
#    * exec prefix:         ${prefix}
#    * arch:                x86_64-darwin17
#    * site arch:           ${arch}
#    * RUBY_BASE_NAME:      ruby
#    * ruby lib prefix:     ${libdir}/${RUBY_BASE_NAME}
#    * site libraries path: ${rubylibprefix}/${sitearch}
#    * vendor path:         ${rubylibprefix}/vendor_ruby
#    * target OS:           darwin17
#    * compiler:            clang
#    * with pthread:        yes
#    * enable shared libs:  no
#    * dynamic library ext: bundle
#    * CFLAGS:              ${optflags} ${debugflags} ${warnflags}
#    * LDFLAGS:             -L. -L/Users/andxyz/.rbenv/versions/2.4.4/lib  \
#                           -fstack-protector -L/usr/local/lib
#    * optflags:            -O2 -fno-fast-math
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
#
# ---
#   CC = clang
#   LD = ld
#   LDSHARED = clang -dynamic -bundle
#   CFLAGS = -g3 -gdwarf-2 -O2 -O2 -Wno-error=shorten-64-to-32  -pipe
#   XCFLAGS = -D_FORTIFY_SOURCE=2 -fstack-protector -fno-strict-overflow -fvisibility=hidden -DRUBY_EXPORT -fPIE
#   CPPFLAGS = -I/Users/andxyz/.rbenv/versions/2.4.4/include  -D_XOPEN_SOURCE -D_DARWIN_C_SOURCE -D_DARWIN_UNLIMITED_SELECT -D_REENTRANT   -I. -I.ext/include/x86_64-darwin17 -I./include -I. -I./enc/unicode/9.0.0
#   DLDFLAGS = -L/Users/andxyz/.rbenv/versions/2.4.4/lib  -Wl,-undefined,dynamic_lookup -Wl,-multiply_defined,suppress -fstack-protector -Wl,-u,_objc_msgSend -Wl,-pie -framework Foundation
#   SOLIBS =
# Apple LLVM version 9.1.0 (clang-902.0.39.2)
# Target: x86_64-apple-darwin17.5.0
# Thread model: posix
# InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin

# if you can find the new version maybe rbenv needs an update...
# rbenv update
# rbenv install --list

brew --prefix openssl
brew --prefix readline

# env -- MAKE_OPT='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi" rbenv install --skip-existing --verbose 1.9.3-p551
# env -- MAKE_OPT='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi" rbenv install --skip-existing --verbose 2.1.5
# env -- MAKE_OPT='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi" rbenv install --skip-existing --verbose 2.1.10
# env -- MAKE_OPT='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi" rbenv install --skip-existing --verbose 2.2.10
# env -- MAKE_OPT='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi" rbenv install --skip-existing --verbose 2.3.1
# env -- MAKE_OPT='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.3.7
# env -- MAKE_OPT='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.4.4
# env -- MAKE_OPT='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.5.1
# env -- MAKE_OPT='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.5.8
# env -- MAKE_OPT='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.6.1
# env -- MAKE_OPT='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.6.3
# env -- MAKE_OPT='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.6.5
# env -- MAKE_OPT='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.6.6
# env -- MAKE_OPT='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.7.0
# env -- MAKE_OPT='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.7.2
# env -- MAKE_OPT='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.7.3
# env -- MAKE_OPT='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.7.4
#
# openssl fun
# https://github.com/postmodern/ruby-install/issues/412
# see also https://github.com/oracle/truffleruby/pull/2557/files
#
env -- MAKE_OPT='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix 'openssl@1.1')  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose "${XYZ_DEFAULT_RUBY}"
# env -- MAKE_OPT='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix 'openssl@3')  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 3.0.2
env -- MAKE_OPT='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix 'openssl@3')  --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 3.1.1

# installer files cleanup
# cd /usr/local
# git checkout master
# git fetch origin
# git reset --hard origin/master
brew cleanup && brew prune
brew doctor

## set my default rubies for new shells
#
# rbenv shell  2.3.7
# rbenv global 2.3.7
# rbenv global 2.5.8
echo "## setting default shell ruby to ${XYZ_DEFAULT_RUBY}"
rbenv shell  "${XYZ_DEFAULT_RUBY}"
rbenv global "${XYZ_DEFAULT_RUBY}"

## show off my new whiz bangs! you guys! We gots whiz-bangs!
rbenv rehash
rbenv versions
## example use cases of some of our plugins

### update all your rubygems and bundlers on all your rubies
function rbenv-update_rubygems_bundler_for_rbenv_all() {
  rbenv update
  rbenv each gem update --system
  rbenv exec gem install bundler -v '~> 1.7'
  rbenv exec gem install bundler -v '~> 2.0'
  rbenv each gem update bundler
}
# rbenv-update_rubygems_bundler_for_rbenv_all;

function rbenv-update_rubygems_bundler_for_rbenv_local() {
  rbenv exec gem update --system
  rbenv exec gem install bundler -v '~> 1.7'
  rbenv exec gem install bundler -v '~> 2.0'
  rbenv exec gem update bundler
  rbenv exec gem list | grep bundler
}
rbenv-update_rubygems_bundler_for_rbenv_local;

# eventmachine openssl issues
# bundle config --global build.eventmachine --with-cppflags=-I$(brew --prefix openssl)/include

### add some default gems for new ruby installs
# gem install bundle pry pry-byebug pry-doc yard bcat
# echo "bundle" >> "${HOME}"/.rbenv/default-gems
# echo "pry" >> "${HOME}"/.rbenv/default-gems
# echo "pry-byebug" >> "${HOME}"/.rbenv/default-gems
# echo "pry-doc" >> "${HOME}"/.rbenv/default-gems
# echo "yard" >> "${HOME}"/.rbenv/default-gems
# echo "foreman" >> "${HOME}"/.rbenv/default-gems
# echo "niceql" >> "${HOME}"/.rbenv/default-gems
# echo "bcat" >> "${HOME}"/.rbenv/default-gems
# echo "gem-browse" >> "${HOME}"/.rbenv/default-gems
# echo "gem-ctags" >> "${HOME}"/.rbenv/default-gems
# echo "rbenv-ctags" >> "${HOME}"/.rbenv/default-gems

# echo "interactive_editor" >> "${HOME}"/.rbenv/default-gems
# echo "awesome_print" >> "${HOME}"/.rbenv/default-gems

# echo "octodown" >> "${HOME}"/.rbenv/default-gems
# echo "octokit" >> "${HOME}"/.rbenv/default-gems
# echo "faraday" >> "${HOME}"/.rbenv/default-gems
# echo "rest-client" >> "${HOME}"/.rbenv/default-gems

#
# cat "${HOME}"/.rbenv/default-gems

### check which rubies have a gem installed for it
# rbenv whence bundle
# rbenv exec gem uninstall bundler -v '1.15.0'
# rbenv exec gem install bundler -v '1.14.6'
#
# rbenv exec gem install rubocop -v '0.54.0'
# rbenv exec gem install rubocop -v '0.58.2'
#

### reinstall pg gem
#
# rbenv exec gem uninstall pg
# brew link --force --overwrite postgresql
# rbenv exec bundle install
#

####
### RED ALERT clean house
####
#
function  rbenv-show_space_usage() {
  du -hsc "$(rbenv root)"
  du -hsc "$(rbenv root)"/versions/*
}
function rbenv-cleanup_gems_for_each_installed_ruby() {
  yes | rbenv each gem cleanup
  rbenv each uninstall_gems.sh

  # now reinstall some basics
  rbenv each gem install 'bundler' 'pry' 'pry-byebug' 'pry-doc' 'yard' 'bcat' 'niceql' 'foreman'
}
# rbenv-show_space_usage;
# rbenv-update_rubygems_bundler_for_rbenv_all;
# rbenv-cleanup_gems_for_each_installed_ruby;
# rbenv-show_space_usage;

exit 0
