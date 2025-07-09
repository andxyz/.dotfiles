#!/usr/bin/env bash
#
# run this file with:
# `cd ~/code/andxyz-dotfiles && ./brew_install_completions.sh`

set -x
set -e

brew tap 'josh/tap'

brew search completion | sort

brew install 'apm-bash-completion'
# brew install 'bash-completion' # for default osx bash 3.7
brew install 'bash-completion@2' # for bash 4+
# brew install 'boom-completion'
brew install 'brew-cask-completion'
brew install 'bundler-completion'
# brew install 'cap-completion'
brew install 'cargo-completion'
# brew install 'django-completion'
# brew install 'docker-completion' # because docker already includes these completion scripts
# brew install 'docker-compose-completion' # because docker-compose already includes completion scripts
# brew install 'docker-machine-completion' # because docker-machine already includes completion scripts
# brew install 'fabric-completion'
brew install 'gem-completion'
# brew install 'gradle-completion' # because bash-completion@2: because Differing version of same formula
# brew install 'grunt-completion'
# brew install 'homesick-completion'
brew reinstall 'josh/tap/swift-completions' || brew install 'josh/tap/swift-completions'
# brew install 'kitchen-completion'
brew install 'launchctl-completion'
# brew install 'maven-completion'
brew install 'mix-completion'
brew install 'open-completion'
brew install 'packer-completion'
brew install 'pip-completion'
brew install 'rails-completion'
brew install 'rake-completion'
brew install 'ruby-completion'
brew install 'rustc-completion'
# brew install 'sonar-completion'
# brew install 'spring-completion'
# brew install 'stormssh-completion'
# brew install 't-completion'
brew install 'tmuxinator-completion'
brew install 'vagrant-completion'
# brew install 'wpcli-completion'
brew install 'yarn-completion'
brew install 'zsh-completions'
