#!/usr/bin/env bash

set -ex

### php
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap josegonzalez/php
#### you should read the following for php
##### `brew options php54`
##### `brew info php54`
##### `brew options php55`
##### `brew info php55`
##### `open http://justinhileman.info/article/reinstalling-php-on-mac-os-x/`
##### `open http://blog.frd.mn/install-nginx-php-fpm-mysql-and-phpmyadmin-on-os-x-mavericks-using-homebrew/`
brew install josegonzalez/php/php55 --with-homebrew-curl --with-homebrew-openssl --with-fpm --with-mysql --with-pgsql
brew install josegonzalez/php/php56 --with-homebrew-curl --with-homebrew-openssl --without-snmp --with-fpm --with-mysql --with-pgsql

### php addons to the addons
##### brew options imagemagick
brew install 'imagemagick'
##### brew info imagemagick

exit 0
