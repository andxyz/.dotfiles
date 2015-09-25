#!/usr/bin/env bash
#
# run this file with:
# `cd ~/code/andxyz-dotfiles && ./brew_install_stuff.sh`

set -xe

### I should get around to putting some of https://gist.github.com/9393431 in here

### current list of crap on my dev machine
### $ brew leaves
# ack ansible apr-util autoenv awscli bash bash-completion bash-git-prompt beanstalk bfg
# caskroom/cask/brew-cask homebrew/completions/bundler-completion homebrew/completions/cargo-completion
# coreutils cppcheck ctags faac ffmpeg findutils gawk homebrew/completions/gem-completion geoip gifsicle
# git gnu-indent gnu-sed gnu-tar gradle graphviz homebrew/dupes/grep homebrew/completions/grunt-completion
# heroku-toolbelt htop-osx httpie hub ical-buddy iftop imagemagick iperf jenv jq libtiff homebrew/versions/llvm35
# macvim man2html homebrew/completions/maven-completion memcached mercurial mitmproxy mongoose
# mysql nginx nmap homebrew/dupes/openssh raggi/ale/openssl-osx-ca ossp-uuid pandoc phantomjs
# homebrew/php/php56 pidcat homebrew/completions/pip-completion postgresql psgrep pstree python
# homebrew/completions/rails-completion homebrew/completions/rake-completion recoverjpeg redis s3cmd
# speedtest_cli subversion the_silver_searcher thefuck tig tldr-pages/tldr/tldr transmission tree v8
# homebrew/completions/vagrant-completion wget xctool youtube-dl homebrew/dupes/zlib zsh zsh-completions

### first off, update all brew installed crap we already have before going forward
brew update
brew upgrade

### enable binary downloads see https://github.com/phinze/homebrew-cask/ for more
brew install caskroom/cask/brew-cask
brew tap homebrew/completions
brew tap homebrew/dupes
brew tap homebrew/php
brew tap homebrew/science
brew tap homebrew/versions
brew tap josegonzalez/php

## house cleaning
brew update
brew upgrade brew-cask
brew cleanup
brew cask cleanup

## LETS COMPILE STUFF

### shared libs and build stuff
brew install 'cmake'
brew install 'openssl'
brew install 'pkg-config'
brew install 'icu4c'
brew install 'openssh'

### shell
brew install 'zsh'
### version control systems
brew install 'git' --with-pcre
# brew upgrade 'git' --with-pcre
brew install 'hub'
# brew cask install 'kaleidoscope' ## i've been doing it manually

### db
brew install 'mysql'
brew install 'postgresql'
brew install 'redis'
### other vcs
brew install 'hg'
brew install 'svn'

### gnu userland utils
brew tap homebrew/dupes
brew install 'coreutils'
brew install 'findutils'
brew install 'gnu-indent'
brew install 'gnu-sed'
brew install 'grep' # gnu grep is in homebrew/dupes
brew install 'gnu-tar'
brew install 'gawk'
brew install 'htop' # brew upgrade 'htop'
sudo chown root:wheel `which htop`
sudo chmod u+s `which htop`

### 3rd-party-toolkits
brew install 'ical-buddy'
brew install 'heroku'

### languages
### see https://github.com/andxyz/.dotfiles/tree/master/languages

### language checkers
brew install 'cppcheck'
# use npm install -g jshint

## LETS INSTALL SOME BINARIES

### text editor
### brew cask install 'sublime-text'
### brew cask install 'sublimetext2'
### brew cask install 'sublimetext3'
brew cask install 'clipmenu'

### vms
brew cask install 'virtualbox'
brew cask install 'vagrant'

### archiving tools
brew cask install 'keka'
brew cask install 'the-unarchiver'

### text editing
brew cask install 'texshop'

### dev
brew cask install 'viscosity'
# brew cask install 'android-studio'
brew cask install 'gitx'
brew cask install 'charles'
brew cask install 'android-file-transfer'
brew cask install 'Dash3'

### ios
##### brew cask install 'reveal'
##### brew cask install 'reflector'

### 3rd-party-plugins
brew cask install 'silverlight'

### video chat
brew cask install 'skype'
brew cask install 'mumble'
brew cask install 'google-hangouts'
### text chat
brew cask install 'hipchat'
##### brew cask install 'slack'
##### brew cask install 'propane'

### playback
brew cask install 'MPlayerX'
brew cask install 'Vox'

### productivity?
brew cask install 'geektool'
brew cask install 'alfred'
brew cask install 'fantastical'
brew cask install 'dropbox'
brew cask install 'transmit'

### maths
brew cask install 'speedcrunch'

### music
# https://github.com/thebitguru/play-button-itunes-patch
brew cask install 'soundcleod'
brew cask install 'plug'
brew cask install 'rdio'
brew cask install 'spotify'

### freelance
brew cask install 'harvest'

### video manipulation
# brew cask install 'miro-video-converter'

### theinternet
brew cask install 'transmission'
brew cask install 'lastfm'

### image manipulation
brew cask install 'xee'

### text manipulation
brew cask install 'calibre'

### OSX hacks
brew cask install 'slimbatterymonitor'
brew cask install 'coconutbattery'
brew cask install 'ukelele'
brew cask install 'karabiner'
brew cask install 'seil'
brew cask install 'rcdefaultapp'
# brew cask install 'RightZoom'

### OSX quicklook plugins
# see https://github.com/sindresorhus/quick-look-plugins
brew cask install 'qlcolorcode' --force
brew cask install 'qlstephen' --force
brew cask install 'qlmarkdown' --force
brew cask install 'quicklook-json' --force
brew cask install 'qlprettypatch' --force
brew cask install 'betterzipql' --force
brew cask install 'webpquicklook' --force
brew cask install 'suspicious-package' --force
brew cask install 'ipaql' --force
brew cask install 'provisionql' --force
brew cask install 'qlimagesize' --force
# brew cask install provisioning
### manual quicklook plugins
# https://github.com/jaketmp/ePub-quicklook
# https://code.google.com/p/cert-quicklook/downloads/list
#
## refresh quicklook plugins
# qlmanage -r

# now run `defaults write com.apple.finder QLEnableTextSelection -bool true && killall Finder`

### link up the folder, so alfred can see the apps
brew cask alfred link

### some brew cleanup
brew cleanup && brew prune
brew doctor
