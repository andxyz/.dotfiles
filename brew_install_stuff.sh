#!/usr/bin/env bash
#
# run this file with:
# `cd ~/code/andxyz-dotfiles && ./brew_install_stuff.sh`

set -x
set -e

### I should get around to putting some of https://gist.github.com/9393431 in here

### current list of crap on my dev machine
### $ brew leaves | paste - - - -
# ack ansible apr-util  autoenv
# awscli  bash  bash-completion bash-git-prompt
# beanstalk bfg caskroom/cask/brew-cask homebrew/completions/bundler-completion
# homebrew/dupes/bzip2  homebrew/completions/cargo-completion carthage  coreutils
# cppcheck  ctags faac  ffmpeg
# findutils gawk  homebrew/completions/gem-completion geoip
# gifsicle  git gnu-indent  gnu-sed
# gnu-tar gradle  graphviz  homebrew/dupes/grep
# homebrew/completions/grunt-completion heroku-toolbelt htop-osx httpie
# hub ical-buddy  iftop imagemagick
# ios-webkit-debug-proxy  iperf jenv  jq
# homebrew/versions/llvm35  macvim  man2html  homebrew/completions/maven-completion
# memcached mercurial mitmproxy mongoose
# mysql nginx nmap  opam
# homebrew/dupes/openssh  raggi/ale/openssl-osx-ca  ossp-uuid pandoc
# parallel  phantomjs josegonzalez/php/php56  pidcat
# homebrew/completions/pip-completion postgresql  psgrep  pstree
# homebrew/completions/rails-completion homebrew/completions/rake-completion  recoverjpeg redis
# s3cmd samba speedtest_cli subversion
# tcpflow the_silver_searcher thefuck tig
# tldr-pages/tldr/tldr  transmission  tree  universal-ctags/universal-ctags/universal-ctags
# v8  homebrew/completions/vagrant-completion homebrew/science/vips watchman
# wget  xctool  youtube-dl  homebrew/dupes/zlib
# zsh zsh-completions

### first off, update all brew installed crap we already have before going forward
brew update
brew outdated
brew upgrade

### enable binary downloads see https://github.com/phinze/homebrew-cask/ for more
brew install caskroom/cask/brew-cask
brew tap 'homebrew/apache'
brew tap 'homebrew/completions'
brew tap 'homebrew/dupes'
brew tap 'homebrew/php'
brew tap 'homebrew/science'
brew tap 'homebrew/versions'
brew tap 'homebrew/bundle'
brew tap 'homebrew/services'
brew tap 'universal-ctags/universal-ctags'
brew tap 'josegonzalez/php'

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
brew install 'carthage'
brew install 'openssh'
brew install 'openssl'
brew install 'libyaml'
brew install 'libffi'
brew install 'readline'
brew link openssl --force || true
brew link libffi --force || true
brew link libyaml --force || true
brew link readline --force || true

# brew upgrade 'openssh'
# brew upgrade 'openssl'
# brew upgrade 'libyaml'
# brew upgrade 'libffi'
# brew upgrade 'readline'
# brew link openssl --force || true
# brew link libffi --force || true
# brew link libyaml --force || true
# brew link readline --force || true
# brew upgrade 'cmake'
# brew upgrade 'pkg-config'
# brew upgrade 'icu4c'
# brew upgrade 'carthage'

### shell
brew install 'zsh'

### version control systems
brew install 'git' --with-pcre
# brew upgrade 'git' --with-pcre
brew install 'hub'
# brew cask install 'kaleidoscope'
## I've been doing it manually you have to click things to install the commandline tools anyway

### db
brew install 'mysql'
brew install 'postgresql'
brew install 'memcached'
brew install 'redis'
### other vcs
brew install 'hg'
brew install 'svn'

### gnu userland utils
brew tap homebrew/dupes
brew install 'coreutils'
brew install 'findutils'
brew isntall 'ag'
brew isntall 'ack'
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
#
brew upgrade brew-cask
brew cleanup
brew cask cleanup

### text editor
### brew cask install 'sublime-text'
### brew cask install 'sublimetext2'
### brew cask install 'sublimetext3''
brew install --HEAD 'universal-ctags/universal-ctags/universal-ctags'
brew install 'tmux'
brew install 'reattach-to-user-namespace'
brew install 'vim'
brew install 'mvim'
brew cask install 'clipmenu'

### tools
brew install 'httpie'
brew install 'homebrew/apache/ab'

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
# brew cask install 'hipchat'
brew cask install 'slack'
# brew cask install 'propane'

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
brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-frei0r \
--with-libass --with-libvo-aacenc --with-libvorbis --with-libvpx \
--with-opencore-amr --with-openjpeg --with-opus \
--with-rtmpdump --with-speex --with-theora --with-tools \
--with-libvorbis --with-theora
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

# color pickers
brew cask install colorpicker-developer --force
brew cask install colorpicker-propicker --force
brew cask install colorpicker-hex --force
brew cask install icolors --force

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
brew cask install 'quicknfo' --force

# brew cask install provisioning
### manual quicklook plugins
# https://github.com/jaketmp/ePub-quicklook
# https://code.google.com/p/cert-quicklook/downloads/list
#
## refresh quicklook plugins
# `cd ~/Library/QuickLook/ && qlmanage -r`

## https://github.com/sindresorhus/quick-look-plugins
## see https://gist.github.com/andxyz/9393431 see _extensions-quicklooks
# preview WebP images: https://github.com/dchest/webp-quicklook
# preview plain text files without an extension: http://whomwah.github.io/qlstephen/
# preview NFO files: https://github.com/planbnet/QuickNFO
# preview code: https://code.google.com/p/qlcolorcode/

# now run `defaults write com.apple.finder QLEnableTextSelection -bool true && killall Finder`

### link up the folder, so alfred can see the apps
brew cask alfred link

### some brew cleanup
brew cleanup && brew prune
brew doctor
