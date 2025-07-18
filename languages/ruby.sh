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
export -- PATH="${HOME}/.rbenv/bin:${PATH}" &&
eval "$(rbenv init -)"

# optional, but recommended:
# https://github.com/rbenv/ruby-build/wiki#suggested-build-environment
echo '## installing recommended homebrew dependencies'
brew update

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
(brew install jemalloc  && brew upgrade libxslt)  || true
(brew install 'openssl@3'  && brew upgrade 'openssl@3')  || true
(brew install 'postgresql@10'  && brew upgrade 'postgresql@10')  || true
(brew install 'postgresql@11'  && brew upgrade 'postgresql@11')  || true
(brew install 'postgresql@13'  && brew upgrade 'postgresql@13')  || true
(brew install 'postgresql@14'  && brew upgrade 'postgresql@14')  || true

brew link openssl --force || true
brew link libffi --force || true
brew link libyaml --force || true
brew link readline --force || true
brew link libxml2 --force || true
brew link libxslt --force || true

xcode-select --install

# bundle config --global build.eventmachine --with-cppflags=-I$(brew --prefix openssl@1.1)/include

# export LDFLAGS="-L/usr/local/opt/curl/lib -L/usr/local/opt/openssl@1.1/lib -L/usr/local/opt/libffi/lib -L/usr/local/opt/readline/lib -L/usr/local/opt/libxml2/lib -L/usr/local/opt/libxslt/lib -L/usr/local/opt/postgresql@10/lib"
# export CPPFLAGS="-I/usr/local/opt/curl/include -I/usr/local/opt/openssl@1.1/include -I/usr/local/opt/libffi/include -I/usr/local/opt/readline/include -I/usr/local/opt/libxml2/include -I/usr/local/opt/libxslt/include -I/usr/local/opt/postgresql@10/include"
# export PKG_CONFIG_PATH="/usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/openssl@1.1/lib/pkgconfig:/usr/local/opt/libffi/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig:/usr/local/opt/libxml2/lib/pkgconfig:/usr/local/opt/libxslt/lib/pkgconfig:/usr/local/opt/postgresql@10/lib/pkgconfig"

## plugins ahoy, see https://github.com/rbenv/rbenv/wiki/Plugins
echo '## installing rbenv plugins'
mkdir "${HOME}"/.rbenv/plugins/
git clone https://github.com/rbenv/ruby-build.git "${HOME}"/.rbenv/plugins/ruby-build
git clone https://github.com/rbenv/rbenv-each.git "${HOME}"/.rbenv/plugins/rbenv-each
git clone https://github.com/rkh/rbenv-update.git "${HOME}"/.rbenv/plugins/rbenv-update
# This plugin is deprecated since its behavior is now included in rbenv core.
# git clone https://github.com/rbenv/rbenv-gem-rehash.git "${HOME}"/.rbenv/plugins/rbenv-gem-rehash # https://github.com/rbenv/rbenv-gem-rehash
git clone https://github.com/rbenv/rbenv-default-gems.git "${HOME}"/.rbenv/plugins/rbenv-default-gems

ls "$(rbenv root)"/plugins

## prepare ruby-build, see https://github.com/rbenv/ruby-build/wiki
cd "$(rbenv root)"/plugins/ruby-build && git pull
cd -

## make sure rbenv is uptodate
rbenv update

## make sure rustc is uptodate for yjit
source_rustup_env
rustup update
# see https://bugs.ruby-lang.org/issues/18912#note-6
# The first try is failed. Because my environment mixed the homebrew binutils built by macOS 12.0(monterey).
brew uninstall binutils

# required for building Ruby <= 1.9.3-p0:
# brew tap 'homebrew/dupes' && brew install 'apple-gcc42'

## install some rubies
echo '## installing rubies'
#
# ---
# Configuration summary for ruby version 3.3.1
#
#    * Installation prefix: /Users/andxyz/.rbenv/versions/3.3.1
#    * exec prefix:         ${prefix}
#    * arch:                x86_64-darwin21
#    * site arch:           ${arch}
#    * RUBY_BASE_NAME:      ruby
#    * enable shared:       yes
#    * ruby lib prefix:     ${libdir}/${RUBY_BASE_NAME}
#    * site libraries path: ${rubylibprefix}/${sitearch}
#    * vendor path:         ${rubylibprefix}/vendor_ruby
#    * target OS:           darwin21
#    * compiler:            clang
#    * with thread:         pthread
#    * with coroutine:      amd64
#    * enable shared libs:  yes
#    * dynamic library ext: bundle
#    * CFLAGS:              -fdeclspec ${optflags} ${debugflags} ${warnflags}
#    * LDFLAGS:             -L. -fstack-protector-strong \
#                           -L/usr/local/opt/gmp/lib
#    * DLDFLAGS:            -L/usr/local/opt/gmp/lib \
#                           -Wl,-multiply_defined,suppress \
#                           -Wl,-undefined,dynamic_lookup
#    * optflags:            -O3 -fno-fast-math
#    * debugflags:          -ggdb3
#    * warnflags:           -Wall -Wextra -Wextra-tokens \
#                           -Wdeprecated-declarations -Wdivision-by-zero \
#                           -Wdiv-by-zero -Wimplicit-function-declaration \
#                           -Wimplicit-int -Wpointer-arith -Wshorten-64-to-32 \
#                           -Wwrite-strings -Wold-style-definition \
#                           -Wmissing-noreturn -Wno-cast-function-type \
#                           -Wno-constant-logical-operand -Wno-long-long \
#                           -Wno-missing-field-initializers \
#                           -Wno-overlength-strings -Wno-parentheses-equality \
#                           -Wno-self-assign -Wno-tautological-compare \
#                           -Wno-unused-parameter -Wno-unused-value \
#                           -Wunused-variable -Wmisleading-indentation -Wundef
#    * strip command:       strip -A -n
#    * install doc:         no
#    * YJIT support:        yes
#    * RJIT support:        yes
#    * man page type:       doc
#    * BASERUBY -v:         ruby 3.2.2 (2023-10-09 revision d994dcbca7) \
#                           [x86_64-darwin21]
#
# ---
# -> make -j4
#    BASERUBY = /Users/andxyz/.rbenv/shims/ruby --disable=gems
#    CC = clang
#    LD = ld
#    LDSHARED = clang -dynamiclib
#    CFLAGS = -g3 -gdwarf-2 -O2  -fdeclspec -O3 -fno-fast-math -ggdb3 -Wall -Wextra -Wextra-tokens -Wdeprecated-declarations -Wdivision-by-zero -Wdiv-by-zero -Wimplicit-function-declaration -Wimplicit-int -Wpointer-arith -Wshorten-64-to-32 -Wwrite-strings -Wold-style-definition -Wmissing-noreturn -Wno-cast-function-type -Wno-constant-logical-operand -Wno-long-long -Wno-missing-field-initializers -Wno-overlength-strings -Wno-parentheses-equality -Wno-self-assign -Wno-tautological-compare -Wno-unused-parameter -Wno-unused-value -Wunused-variable -Wmisleading-indentation -Wundef  -fno-common -pipe
#    XCFLAGS = -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -fstack-protector-strong -fno-strict-overflow -fvisibility=hidden -DRUBY_EXPORT -I. -I.ext/include/x86_64-darwin21 -I./include -I. -I./prism -I./enc/unicode/15.0.0 -I/usr/local/opt/gmp/include
#    CPPFLAGS = -D_XOPEN_SOURCE -D_DARWIN_C_SOURCE -D_DARWIN_UNLIMITED_SELECT -D_REENTRANT
#    DLDFLAGS = -L/usr/local/opt/gmp/lib -Wl,-multiply_defined,suppress -Wl,-undefined,dynamic_lookup -install_name /Users/andxyz/.rbenv/versions/3.3.1/lib/libruby.3.3.dylib -compatibility_version 3.3 -current_version 3.3.1  -fstack-protector-strong -framework CoreFoundation  -fstack-protector-strong -framework CoreFoundation
#    SOLIBS = -lgmp -ldl -lobjc -lpthread
#    LANG = en_US.UTF-8
#    LC_ALL = en_US.UTF-8
#    LC_CTYPE = en_US.UTF-8
#    MFLAGS = - --jobserver-fds=5,6 -j
#    RUSTC = rustc
#    YJIT_RUSTC_ARGS = --crate-name=yjit --crate-type=staticlib --edition=2021 -g -C lto=thin -C opt-level=3 -C overflow-checks=on '--out-dir=/Users/andxyz/.rbenv/sources/3.3.1/ruby-3.3.1/yjit/target/release/' ./yjit/src/lib.rs
# Apple clang version 13.1.6 (clang-1316.0.21.2.5)
# Target: x86_64-apple-darwin21.6.0
# Thread model: posix
# InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin

# if you can find the new version maybe rbenv needs an update...
# rbenv update
# rbenv install --list

brew --prefix openssl@1.0
brew --prefix openssl@1.1
brew --prefix openssl@3
brew --prefix readline

# For clang, some older rubies might need this
# RUBY_CFLAGS='-Wno-error=implicit-function-declaration'
#
# see https://github.com/rbenv/ruby-build/wiki/Home/
#
# # https://apple.stackexchange.com/questions/148901/why-does-my-brew-installation-not-work

if [[ "$(uname)" == "darwin"* ]]; then
   eval $(/usr/local/bin/brew shellenv)
fi

#
# env -- MAKE_OPTS='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)       --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi" rbenv install --skip-existing --verbose 1.9.3-p551
# env -- MAKE_OPTS='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)       --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi" rbenv install --skip-existing --verbose 2.1.5
# env -- MAKE_OPTS='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)       --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi" rbenv install --skip-existing --verbose 2.1.10
# env -- MAKE_OPTS='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)       --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi" rbenv install --skip-existing --verbose 2.2.10
# env -- MAKE_OPTS='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)       --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi" rbenv install --skip-existing --verbose 2.3.1
# env -- MAKE_OPTS='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)       --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.3.7
# env -- MAKE_OPTS='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)       --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.4.4
# env -- MAKE_OPTS='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)       --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.5.1
# env -- MAKE_OPTS='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)       --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.5.8
# env -- MAKE_OPTS='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)       --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.6.1
# env -- MAKE_OPTS='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)       --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.6.3
# env -- MAKE_OPTS='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)       --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.6.5
# env -- MAKE_OPTS='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)       --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.6.6
# env -- MAKE_OPTS='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)       --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.7.0
# env -- MAKE_OPTS='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)       --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.7.2
# env -- MAKE_OPTS='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)       --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.7.3
# env -- MAKE_OPTS='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)       --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.7.4
# env -- MAKE_OPTS='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix 'openssl@1.1') --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.7.5
# env -- MAKE_OPTS='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix 'openssl@3')   --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.7.6
# env -- MAKE_OPTS='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix 'openssl@3')   --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 2.7.7
# env -- MAKE_OPTS='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix 'openssl@3')   --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 3.0.2
# env -- MAKE_OPTS='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix 'openssl@3')   --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 3.0.5
# env -- MAKE_OPTS='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix 'openssl@3')   --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 3.1.3
# env -- MAKE_OPTS='-j8' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--enable-yjit --with-openssl-dir=$(brew --prefix 'openssl@3') --with-readline-dir=$(brew --prefix readline) --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 3.2.2
#
# env -- MAKE_OPTS='-j4' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--enable-yjit --with-jemalloc-dir=$(brew --prefix 'jemalloc') --with-openssl-dir=$(brew --prefix 'openssl@3') --with-readline-dir=$(brew --prefix readline) --with-libyaml-dir=$(brew --prefix 'libyaml') --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose 3.2.2-pshopify19
# env -- MAKE_OPTS='-j4' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--enable-yjit --enable-shared --with-jemalloc-dir=$(brew --prefix 'jemalloc') --with-openssl-dir=$(brew --prefix 'openssl@3') --with-readline-dir=$(brew --prefix readline) --with-libyaml-dir=$(brew --prefix 'libyaml') --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --verbose --keep 3.3.1 | tee ~/.rbenv/sources/ruby-3.3.1-build.log
#
#
# https://github.com/Shopify/ruby-definitions
cd ~/code/personal/shopify-ruby && bundle install
eval `rbenv exec bundle exec shopify-ruby env`
rbenv install --list-all | grep -i shopify
env -- MAKE_OPTS='-j4' CFLAGS='-g3 -gdwarf-2 -O2' RUBY_CONFIGURE_OPTS="--enable-yjit --with-jemalloc-dir=$(brew --prefix 'jemalloc') --with-openssl-dir=$(brew --prefix 'openssl@3') --with-readline-dir=$(brew --prefix readline) --with-libyaml-dir=$(brew --prefix 'libyaml') --disable-install-doc --disable-install-rdoc --disable-install-capi --enable-dtrace" rbenv install --skip-existing --verbose v3.4.1-pshopify1

#
# openssl fun
# https://github.com/postmodern/ruby-install/issues/412
# see also https://github.com/oracle/truffleruby/pull/2557/files
#
# brew install openssl@1.0
#
# ➜ ln -s /usr/local/Cellar/openssl@1.0/1.0.2t/lib/libssl.1.0.0.dylib /usr/local/opt/openssl/lib/libssl.1.0.0.dylib
# ➜ ln -s /usr/local/Cellar/openssl@1.0/1.0.2t/lib/libcrypto.1.0.0.dylib /usr/local/opt/openssl/lib/libcrypto.1.0.0.dylib
#
## More details about the older openssl
# see https://github.com/Shopify/homebrew-shopify/blob/54eb5510659b9674eed884eaa96cd332376d05b5/openssl%401.0.rb
#
# ➜ brew info 'openssl@1.0'
#
# ==> shopify/shopify/openssl@1.0: stable 1.0.2t (bottled) [keg-only]
# SSL/TLS cryptography library
# https://openssl.org/
# Installed
# /usr/local/Cellar/openssl@1.0/1.0.2t (1,788 files, 12MB)
#   Poured from bottle on 2024-05-21 at 15:15:09
# From: https://github.com/shopify/homebrew-shopify/blob/HEAD/openssl@1.0.rb
# ==> Caveats
# A CA file has been bootstrapped using certificates from the SystemRoots
# keychain. To add additional certificates (e.g. the certificates added in
# the System keychain), place .pem files in
#   /usr/local/etc/openssl/certs

# and run
#   /usr/local/opt/openssl@1.0/bin/c_rehash

# openssl@1.0 is keg-only, which means it was not symlinked into /usr/local,
# because Apple has deprecated use of OpenSSL in favor of its own TLS and crypto libraries.

# If you need to have openssl@1.0 first in your PATH, run:
#   echo 'export PATH="/usr/local/opt/openssl@1.0/bin:$PATH"' >> ~/.zshrc

# For compilers to find openssl@1.0 you may need to set:
#   export LDFLAGS="-L/usr/local/opt/openssl@1.0/lib"
#   export CPPFLAGS="-I/usr/local/opt/openssl@1.0/include"

# For pkg-config to find openssl@1.0 you may need to set:
#   export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.0/lib/pkgconfig"
#
# ➜ brew list --formula 'openssl@1.0'
# /usr/local/Cellar/openssl@1.0/1.0.2t/bin/c_rehash
# /usr/local/Cellar/openssl@1.0/1.0.2t/bin/openssl
# /usr/local/Cellar/openssl@1.0/1.0.2t/include/openssl/ (75 files)
# /usr/local/Cellar/openssl@1.0/1.0.2t/lib/libcrypto.1.0.0.dylib
# /usr/local/Cellar/openssl@1.0/1.0.2t/lib/libssl.1.0.0.dylib
# /usr/local/Cellar/openssl@1.0/1.0.2t/lib/engines/ (12 files)
# /usr/local/Cellar/openssl@1.0/1.0.2t/lib/pkgconfig/ (3 files)
# /usr/local/Cellar/openssl@1.0/1.0.2t/lib/ (4 other files)
# /usr/local/Cellar/openssl@1.0/1.0.2t/sbom.spdx.json
# /usr/local/Cellar/openssl@1.0/1.0.2t/share/man/ (1683 files)

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
XYZ_DEFAULT_RUBY="3.3.1"
# export -- XYZ_DEFAULT_RUBY
#
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
  # rbenv exec gem install bundler -v '~> 1.7'
  rbenv each gem install bundler -v '~> 2.0'
  rbenv each gem update bundler
}
# rbenv-update_rubygems_bundler_for_rbenv_all;

function rbenv-update_rubygems_bundler_for_rbenv_local() {
  rbenv exec gem update --system
  # rbenv exec gem install bundler -v '~> 1.7'
  rbenv exec gem install bundler -v '~> 2.0'
  rbenv exec gem update bundler
  rbenv exec gem list | grep bundler
}
rbenv-update_rubygems_bundler_for_rbenv_local;

# eventmachine openssl issues
# bundle config --global build.eventmachine --with-cppflags=-I$(brew --prefix openssl)/include

### add some default gems for new ruby installs
# gem install
echo "debug" >> "${HOME}"/.rbenv/default-gems
echo "pry" >> "${HOME}"/.rbenv/default-gems
echo "pry-byebug" >> "${HOME}"/.rbenv/default-gems
echo "pry-doc" >> "${HOME}"/.rbenv/default-gems
echo "yard" >> "${HOME}"/.rbenv/default-gems
# echo "foreman" >> "${HOME}"/.rbenv/default-gems
# echo "niceql" >> "${HOME}"/.rbenv/default-gems
# echo "bcat" >> "${HOME}"/.rbenv/default-gems

# echo "interactive_editor" >> "${HOME}"/.rbenv/default-gems
# echo "awesome_print" >> "${HOME}"/.rbenv/default-gems

# echo "octodown" >> "${HOME}"/.rbenv/default-gems
# echo "octokit" >> "${HOME}"/.rbenv/default-gems
# echo "faraday" >> "${HOME}"/.rbenv/default-gems
# echo "rest-client" >> "${HOME}"/.rbenv/default-gems

# cat "${HOME}"/.rbenv/default-gems

### check which rubies have a gem installed for it
# rbenv whence bundle
# rbenv exec gem uninstall bundler -v '1.15.0'
# rbenv exec gem install bundler -v '1.14.6'
# rbenv exec gem install bundler -v '2.5.10'
#
# rbenv exec gem install rubocop -v '0.54.0'
# rbenv exec gem install rubocop -v '0.58.2'
#

### reinstall pg gem
#
# rbenv exec gem uninstall pg
# brew link --force --overwrite postgresql@16
# rbenv exec bundle install
#

####
### RED ALERT clean house
####
#
function rbenv-show_space_usage() {
  du -hsc "$(rbenv root)"
  du -hsc "$(rbenv root)"/versions/*
}
function rbenv-cleanup_gems_for_each_installed_ruby() {
  yes | rbenv each gem cleanup
  rbenv each uninstall_gems.sh

  # now reinstall some basics
  rbenv each gem install 'bundler' 'pry' 'pry-byebug' 'pry-doc' 'yard' 'debug'
}
# rbenv-show_space_usage;
# rbenv-update_rubygems_bundler_for_rbenv_all;
# rbenv-cleanup_gems_for_each_installed_ruby;
# rbenv-show_space_usage;

exit 0
