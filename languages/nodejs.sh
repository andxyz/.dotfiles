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
git tag --list
git checkout v0.33.2

nvm ls-remote
nvm install v7.10.0
nvm install v6.10.3
nvm install v5.11.1
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
nvm alias default v7.10.0
### for this shell right now. now now? like now? yes, right now now.
nvm use v7.10.0

## install some decent global libraries on the default node
#### npm update -g --silent npm
npm update -g --silent npm
npm install -g --silent --no-progress --quiet --depth=0 npm-shrinkwrap
npm install -g --silent --no-progress --quiet --depth=0 node-inspector
npm install -g --silent --no-progress --quiet --depth=0 bower
npm install -g --silent --no-progress --quiet --depth=0 grunt
npm install -g --silent --no-progress --quiet --depth=0 grunt-cli
npm install -g --silent --no-progress --quiet --depth=0 gulp

## linting
npm install -g --silent --no-progress --quiet --depth=0 babel-eslint
npm install -g --silent --no-progress --quiet --depth=0 jshint

## front end tools
npm install -g --silent --no-progress --quiet --depth=0 handlebars
npm install -g --silent --no-progress --quiet --depth=0 less

## chrome tools
npm install -g --silent --no-progress --quiet --depth=0 yo
npm install -g --silent --no-progress --quiet --depth=0 generator-chrome-extension

## tools
npm install -g --silent --no-progress --quiet --depth=0 diff-so-fancy
npm install -g --silent --no-progress --quiet --depth=0 ios-sim
npm install -g --silent --no-progress --quiet --depth=0 ios-deploy

# npm install -g --silent pageres
# npm install -g --silent supervisor
# npm install -g --silent watchify
# npm install -g --silent forever
# npm install -g --silent nodemon
# npm install -g --silent foreman
# npm install -g --silent norman

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
### jshint
### less
### node
### nodemon
### norman
### npm
### pageres
### recursive
### supervisor
### watchify

echo "show off the whizbangs"
npm list -g --no-progress --quiet --depth=0
nvm ls

# echo 'I recommend forcing exact versions for working with emberjs'
# echo 'example:   npm install -g --silent ember-cli@1.13.13'
# echo 'example:   npm install -g --silent bower@1.6.5'

exit 0
