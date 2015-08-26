#!/usr/bin/env bash
#
# run this file with
##### `cd ~/code/andxyz-dotfiles && ./brew_install_stuff.sh`

set -xe

### I should get around to putting some of https://gist.github.com/9393431 in here

### current list of crap on my dev machine
### $ brew list
# ab      bison     ffmpeg      gnu-indent    imagemagick   macvim      pcre      readline    vagrant-completion
# ack     brew-cask   findutils   gnu-sed     jenv      maven-completion  phantomjs   recoverjpeg   wget
# ansible     bundler-completion  freetype    gnu-tar     jpeg      memcached   php56     redis     x264
# apr     cargo-completion  gawk      gradle      jq      mercurial   pidcat      s3cmd     xvid
# apr-util    cmake     gdbm      grep      lame      mitmproxy   pip-completion    sqlite      xz
# autoconf    coreutils   gem-completion    grunt-completion  libevent    mongoose    pkg-config    subversion    zlib
# automake    cppcheck    geoip     heroku-toolbelt   libffi      mysql     postgresql    the_silver_searcher zsh
# awscli      cscope      geoipupdate   htop-osx    libpng      nginx     psgrep      tldr      zsh-completions
# bash-completion   ctags     gettext     httpie      libtiff     openssh     pstree      transmission
# bash-git-prompt   curl      gifsicle    hub     libtool     openssl     python      tree
# beanstalk   elasticsearch   git     ical-buddy    libvo-aacenc    ossp-uuid   rails-completion  unixodbc
# bfg     faac      gmp     icu4c     libyaml     pandoc      rake-completion   v8

### first off, update all brew installed crap we already have before going forward
brew update
brew upgrade

#### enable binary downloads see https://github.com/phinze/homebrew-cask/ for more
brew install caskroom/cask/brew-cask
brew tap homebrew/completions
brew tap homebrew/dupes
brew tap homebrew/php
brew tap homebrew/science
brew tap homebrew/versions
brew tap josegonzalez/php

## LETS COMPILE STUFF

### shared libs and build stuff
brew install 'cmake'
brew install 'openssl'
brew install 'pkg-config'
brew install 'icu4c'

### shell
brew install 'zsh'
### version control systems
brew install 'git' --with-pcre
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
brew install 'htop'
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
brew cask install 'qlcolorcode'
brew cask install 'qlstephen'
brew cask install 'qlmarkdown'
brew cask install 'quicklook-json'
brew cask install 'qlprettypatch'
brew cask install 'betterzipql'
brew cask install 'webp-quicklook'
brew cask install 'suspicious-package'
brew cask install 'ipaql'
brew cask install 'provisionql'
brew cask install 'qlimagesize'
### manual quicklook plugins
# https://github.com/jaketmp/ePub-quicklook
# https://code.google.com/p/cert-quicklook/downloads/list

# now run `defaults write com.apple.finder QLEnableTextSelection -bool true && killall Finder`

### link up the folder, so alfred can see the apps
brew cask alfred link

### some brew cleanup
brew cleanup && brew prune
brew doctor
