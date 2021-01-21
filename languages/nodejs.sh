#!/usr/bin/env bash

set -x
set -e

## see https://github.com/creationix/nvm
! test -d ~/.nvm &&
git clone https://github.com/creationix/nvm.git ~/.nvm

source $HOME/.nvm/nvm.sh
# nvm unload

# update nvm
cd ~/.nvm
git pull
git fetch --tags
git tag --list
git checkout v0.37.2
# git checkout v0.35.3
# git checkout v0.33.6

nvm ls-remote
nvm install v14.15.4
# nvm install v10.16.3
# nvm install v10.12.0
# nvm install v8.9.4
# nvm install v7.10.1
# nvm install v6.12.3
# nvm install v5.11.1
# nvm install v8.9.1
# nvm install v7.10.0
# nvm install v6.10.3
# nvm install v5.11.1
# nvm install v5.2.0
# nvm install v0.12.2
# nvm install v0.11.13
# nvm install v0.11.12
# nvm install v0.11.14
# nvm install v0.10.31
# nvm install v0.10.28
# nvm install v0.10.26
# nvm install v0.10.25

## set our dev machine defaults
### for future shells
nvm alias default v14.15.4
### for this shell right now. now now? like now? yes, right now now.
nvm use v14.15.4

## update npm
npm update -g --silent npm

## install some decent global libraries on the default node
# npm install -g --silent --no-progress --quiet --depth=0 npm-shrinkwrap
# npm install -g --silent --no-progress --quiet --depth=0 node-inspector
npm install -g --silent --no-progress --quiet --depth=0 yarn
npm install -g --silent --no-progress --quiet --depth=0 webpack
# npm install -g --silent --no-progress --quiet --depth=0 bower
# npm install -g --silent --no-progress --quiet --depth=0 grunt
# npm install -g --silent --no-progress --quiet --depth=0 grunt-cli
# npm install -g --silent --no-progress --quiet --depth=0 gulp

## linting
npm install -g --silent --no-progress --quiet --depth=0 prettier
npm install -g --silent --no-progress --quiet --depth=0 eslint
npm install -g --silent --no-progress --quiet --depth=0 babel-eslint
npm install -g --silent --no-progress --quiet --depth=0 coffeelint
npm install -g --silent --no-progress --quiet --depth=0 jshint
npm install -g --silent --no-progress --quiet --depth=0 postcss
npm install -g --silent --no-progress --quiet --depth=0 stylelint
npm install -g --silent --no-progress --quiet --depth=0 js-beautify

## front end tools
# npm install -g --silent --no-progress --quiet --depth=0 handlebars
# npm install -g --silent --no-progress --quiet --depth=0 less
npm install -g --silent --no-progress --quiet --depth=0 sass

## chrome tools
# npm install -g --silent --no-progress --quiet --depth=0 yo
# npm install -g --silent --no-progress --quiet --depth=0 generator-chrome-extension

## tools
npm install -g --silent --no-progress --quiet --depth=0 diff-so-fancy
# npm install -g --silent --no-progress --quiet --depth=0 ios-sim
# npm install -g --silent --no-progress --quiet --depth=0 ios-deploy

## emberjs tools
# echo 'I recommend forcing exact versions for working with emberjs'
# echo 'example:   npm install -g --silent ember-cli@1.13.13'
# echo 'example:   npm install -g --silent bower@1.6.5'

# npm install -g --silent pageres
# npm install -g --silent supervisor
# npm install -g --silent watchify
# npm install -g --silent forever
# npm install -g --silent nodemon
# npm install -g --silent foreman
# npm install -g --silent norman

### prettier
### pm2
### pageres
### jshint
### recursive-blame
### bower
### component
### foreman
### forever
### gramework
### grunt
### grunt
### gulp
### handlebars
### less
### node
### nodemon
### norman
### npm
### recursive
### supervisor
### watchify

echo "show off the whizbangs"
npm list -g --no-progress --quiet --depth=0
nvm ls

# $ echo "show off the whizbangs"
# npm list -g --no-progress --quiet --depth=0
# nvm ls
# show off the whizbangs
# $ cd ~
# ~
# $ npm list -g --no-progress --quiet --depth=0
# /Users/andrew/.nvm/versions/node/v10.16.3/lib
# ├── babel-eslint@10.0.2
# ├── bower@1.8.8
# ├── coffeelint@2.1.0
# ├── diff-so-fancy@1.2.5
# ├── eslint@6.2.1
# ├── grunt@1.0.4
# ├── grunt-cli@1.3.2
# ├── gulp@4.0.2
# ├── jshint@2.10.2
# ├── npm@6.11.0
# ├── postcss@7.0.17
# ├── prettier@1.18.2
# └── stylelint@10.1.0

# ~
# $ nvm ls
# ->     v10.16.3
#          system
# default -> v10.16.3
# node -> stable (-> v10.16.3) (default)
# stable -> 10.16 (-> v10.16.3) (default)
# iojs -> N/A (default)
# unstable -> N/A (default)
# lts/* -> lts/dubnium (-> v10.16.3)
# lts/argon -> v4.9.1 (-> N/A)
# lts/boron -> v6.17.1 (-> N/A)
# lts/carbon -> v8.16.1 (-> N/A)
# lts/dubnium -> v10.16.3

exit 0
