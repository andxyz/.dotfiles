#!/usr/bin/env bash

set -ex

### php
#brew untap josegonzalez/php
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/php

#### you should read the following for php:
#
##### `brew options homebrew/php/php54`
##### `brew info homebrew/php/php54`
#
##### `brew options homebrew/php/php55`
##### `brew info homebrew/php/php55`
#
##### `brew options homebrew/php/php56`
##### `brew info homebrew/php/php56`
##### `open http://justinhileman.info/article/reinstalling-php-on-mac-os-x/`
##### `open http://blog.frd.mn/install-nginx-php-fpm-mysql-and-phpmyadmin-on-os-x-mavericks-using-homebrew/`
brew install homebrew/php/php55 --with-homebrew-curl --with-homebrew-openssl --with-fpm --with-mysql --with-pgsql
brew install homebrew/php/php56 --with-homebrew-curl --with-homebrew-openssl --without-snmp --with-fpm --with-mysql --with-postgresql

### php addons to the addons
##### brew options imagemagick
##### brew info imagemagick
brew install 'imagemagick'


exit 0
