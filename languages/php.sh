#!/usr/bin/env bash

set -ex

### php
brew untap 'homebrew/dupes' || true # depreciated
brew untap 'homebrew/versions' || true # depreciated
brew untap 'josegonzalez/php' || true # depreciated
brew tap 'homebrew/php'

#### you should read the following for php:
##
# `brew options homebrew/php/php54`
# `brew info homebrew/php/php54`
##
# `brew options homebrew/php/php55`
# `brew info homebrew/php/php55`
##
# `brew options homebrew/php/php56`
# `brew info homebrew/php/php56`
##
# `brew options homebrew/php/php71`
# `brew info homebrew/php/php71`

# brew install homebrew/php/php55 --with-homebrew-curl --with-homebrew-openssl --with-fpm --with-mysql --with-pgsql
brew install 'homebrew/php/php56' --with-homebrew-curl --with-homebrew-openssl --without-snmp --with-fpm --with-mysql --with-postgresql

#### php addons to the addons
# brew search 'homebrew/php'
# brew options 'homebrew/php/php56-memcache'
# brew options 'homebrew/php/php56-imagick'
# brew info 'homebrew/php/php56-imagick'

exit 0
