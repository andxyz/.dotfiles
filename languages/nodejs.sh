#!/usr/bin/env bash
set -xe

### see https://github.com/creationix/nvm
! test -d ~/.nvm &&
git clone https://github.com/creationix/nvm.git ~/.nvm

source $HOME/.nvm/nvm.sh

# nvm ls-remote
nvm install v0.12.2
nvm install v0.11.13
nvm install v0.11.12
nvm install v0.11.14
nvm install v0.10.31
nvm install v0.10.28
nvm install v0.10.26
nvm install v0.10.25

## set our dev machine defaults
### for future shells
nvm alias default v0.12.2
### for this shell right now. now now? like now? yes, right now now.
nvm use v0.12.2

## install some decent global libraries on the default node
#### npm install -g npm --silent &&
npm install -g --silent node-inspector
npm install -g --silent bower
npm install -g --silent grunt
npm install -g --silent grunt-cli
npm install -g --silent gulp
npm install -g --silent jshint

# npm install -g --silent handlebars
# npm install -g --silent less

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

## show off the whizbangs
npm list -g --depth=0
nvm ls

exit 0