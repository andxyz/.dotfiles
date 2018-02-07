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
git checkout v0.33.8
# git checkout v0.33.6

nvm ls-remote
nvm install v8.9.4
nvm install v7.10.1
nvm install v6.12.3
nvm install v5.11.1
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
nvm alias default v8.9.4
### for this shell right now. now now? like now? yes, right now now.
nvm use v8.9.4

## update npm
npm update -g --silent npm

## install some decent global libraries on the default node
# npm install -g --silent --no-progress --quiet --depth=0 npm-shrinkwrap
npm install -g --silent --no-progress --quiet --depth=0 node-inspector
npm install -g --silent --no-progress --quiet --depth=0 bower
npm install -g --silent --no-progress --quiet --depth=0 grunt
npm install -g --silent --no-progress --quiet --depth=0 grunt-cli
npm install -g --silent --no-progress --quiet --depth=0 gulp

## linting
npm install -g --silent --no-progress --quiet --depth=0 prettier
npm install -g --silent --no-progress --quiet --depth=0 babel-eslint
npm install -g --silent --no-progress --quiet --depth=0 jshint

## front end tools
# npm install -g --silent --no-progress --quiet --depth=0 handlebars
# npm install -g --silent --no-progress --quiet --depth=0 less

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
# /Users/andxyz/.nvm/versions/node/v8.9.1/lib
# ├── babel-eslint@8.0.2
# ├── bower@1.8.2
# ├── diff-so-fancy@1.1.1
# ├── generator-chrome-extension@0.7.0
# ├── grunt@1.0.1
# ├── grunt-cli@1.2.0
# ├── gulp@3.9.1
# ├── handlebars@4.0.11
# ├── ios-deploy@1.9.2
# ├── ios-sim@6.1.2
# ├── jshint@2.9.5
# ├── less@2.7.3
# ├── npm@5.5.1
# ├── npm-shrinkwrap@6.1.0
# ├── prettier@1.8.2
# └── yo@2.0.0

#         v0.12.2
#         v0.12.7
#     iojs-v3.3.1
#          v4.1.0
#          v4.2.1
#          v5.1.0
#          v5.2.0
#         v5.11.1
#          v6.9.1
#         v6.11.3
#          v7.5.0
#          v8.3.0
#          v8.6.0
# ->       v8.9.1
#          system
# current -> v5.1.0
# default -> v8.9.1
# node -> stable (-> v8.9.1) (default)
# stable -> 8.9 (-> v8.9.1) (default)
# iojs -> iojs-v3.3 (-> iojs-v3.3.1) (default)
# lts/* -> lts/carbon (-> v8.9.1)
# lts/argon -> v4.8.6 (-> N/A)
# lts/boron -> v6.12.0 (-> N/A)
# lts/carbon -> v8.9.1

exit 0
