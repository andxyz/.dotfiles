#!/usr/bin/env bash
#
# run this file with:
# `cd ~/code/andxyz-dotfiles && ./brew_install_stuff.sh`

set -x
set -e

### first off, update all brew installed crap we already have before going forward
## house cleaning round 1
brew update
brew cleanup -s
# brew cask tricks
# mv /opt/homebrew-cask/Caskroom /usr/local/Caskroom
# find ~/Applications -lname '/opt/*' -exec sh -c 'ln -sf "$(readlink "$0" | gsed s:^/opt/homebrew\-cask/:/usr/local/:g)" "$0"' {} \;
# read up https://github.com/caskroom/homebrew-cask/issues/9685
brew prune
brew outdated

# tips for dependency checking
# brew deps --installed --tree | less -i ab
# brew deps homebrew/apache/ab
# brew uses --installed apr

### enable binary downloads see https://github.com/phinze/homebrew-cask/ for more

brew tap 'homebrew/aliases'
brew tap 'homebrew/apache'
brew tap 'homebrew/bundle'
brew tap 'homebrew/dev-tools'
brew tap 'homebrew/php'
brew tap 'homebrew/nginx'
brew tap 'homebrew/science'
brew tap 'homebrew/services'
brew tap 'universal-ctags/universal-ctags'
brew tap 'samdmarshall/formulae'

brew untap 'homebrew/binary' || true # was deprecated. This tap is now empty as all its formulae were migrated.
brew untap 'homebrew/completions' || true # was deprecated. This tap is now empty as all its formulae were migrated.
brew untap 'homebrew/dupes' || true # was deprecated. This tap is now empty as all its formulae were migrated.
brew untap 'homebrew/fuse' || true # was deprecated. This tap is now empty as all its formulae were migrated.
brew untap 'homebrew/python' || true # was deprecated. This tap is now empty as all its formulae were migrated.
brew untap 'homebrew/tex' || true # was deprecated. This tap is now empty as all its formulae were migrated.
brew untap 'homebrew/versions' || true # was deprecated. This tap is now empty as all its formulae were migrated.
brew untap 'josegonzalez/php' || true # was deprecated. for 'homebrew/php'

## house cleaning round 2
brew update
brew upgrade 'brew-cask' || true
brew cleanup
brew cask cleanup

## LET US COMPILE STUFF

### shared libs and build stuff
brew install 'vbindiff'
brew install 'binutils'
brew install 'automake'
brew install 'autoconf'
brew install 'cmake'
brew install 'pkg-config'
brew install 'icu4c'
## link it up my dearest
brew install 'openssl'
brew link openssl --force || true
brew install 'openssh' --with-brewed-openssl
brew link openssh --force || true
brew install 'gettext'
brew link gettext --force || true
brew install 'openssl'
brew link openssl --force || true
brew install 'libyaml'
brew link libyaml --force || true
brew install 'libffi'
brew link libffi --force || true
brew install 'readline'
brew link readline --force || true
brew install 'gcc'
brew link gcc --force || true
## ios
brew install 'carthage'

# brew upgrade 'openssh'
# brew upgrade 'openssl'
# brew upgrade 'libyaml'
# brew upgrade 'libffi'
# brew upgrade 'readline'
# brew upgrade 'gettext'
# brew link openssh --force || true
# brew link openssl --force || true
# brew link libffi --force || true
# brew link libyaml --force || true
# brew link readline --force || true
# brew link gettext --force || true
# brew upgrade 'cmake'
# brew upgrade 'pkg-config'
# brew upgrade 'icu4c'
# brew upgrade 'carthage'

### shell
brew install 'zsh'

### version control systems
# brew options git
brew install 'curl' --with-openssl
brew install 'git' --with-pcre --with-brewed-curl --with-brewed-openssl
#brew upgrade 'git' --with-pcre --with-brewed-curl --with-brewed-openssl
brew install 'hub'
# brew cask install 'kaleidoscope'
## I've been doing it manually you have to click things to install the commandline tools anyway

### db services
brew install 'mysql@5.6'
brew services stop 'mysql@5.6'
brew link --force 'mysql@5.6'

brew install 'postgresql@9.6'
brew services stop 'postgresql@9.6'
brew link --force 'postgresql@9.6'

brew install 'memcached'
brew services stop 'memcached'
brew install 'redis'
brew services stop 'redis'

### other vcs
brew install 'hg'
brew install 'svn'

### gnu userland utils
brew untap 'homebrew/dupes'
brew install 'ack'
brew install 'binutils'
brew install 'coreutils'
brew install 'diffutils'
brew install 'findutils'
brew install 'gawk'
brew install 'gnu-indent'
brew install 'gnu-sed'
brew install 'gnu-tar'
brew install 'gnutls'
brew install 'grep'
brew install 'gzip'
brew install 'less'
brew install 'moreutils' --without-parallel
brew install 'parallel'

## ps tools
brew install 'proctools'
brew install 'psgrep'
brew install 'pstree'

### zip tools
brew install 'pbzip2'
brew install 'p7zip'
brew install 'unrar'

brew install 'htop' # brew upgrade 'htop'
sudo chown root:wheel `which htop`
sudo chmod u+s `which htop`

### 3rd-party-toolkits
brew install 'ical-buddy'
brew install 'heroku'

### languages
### see https://github.com/andxyz/.dotfiles/tree/master/languages
# brew install 'rust'
# brew link 'rust' --force --overwrite || true

### language checkers
brew install 'cppcheck'
brew install 'clang-format'
# use npm install -g jshint

## LETS INSTALL SOME BINARIES
#
brew cleanup -s
# brew upgrade 'brew-cask' || true
brew cask cleanup

### text editor
### brew cask install 'sublime-text'
### brew cask install 'sublimetext2'
### brew cask install 'sublimetext3''
brew install --HEAD 'universal-ctags/universal-ctags/universal-ctags'
brew install 'tmux' --with-utf8proc
brew install 'reattach-to-user-namespace'
brew install 'vim' --with-lua --with-luajit
brew install 'macvim' --with-lua --with-luajit
# brew cask install 'clipmenu'
brew cask install clippy
brew install 'fzf'
brew install 'fpp'

### remoting tools
brew install 'rsync'

### http tools
brew install 'httpie'
brew tap 'apache/apache/ab'
brew install 'apache/apache/ab'
brew install 'jq'

## search tools
brew install 'ack'
brew install 'ag'
brew install 'aykamko/tag-ag/tag-ag'
brew install 'ripgrep'


### tools
brew install 'terraform'
brew tap 'shopify/shopify'
brew install 'shopify/shopify/toxiproxy'

### web servers
## nginx
#brew options nginx-full
#brew info nginx-full
#brew install nginx-full --with-upload-module

### vms
brew cask install 'virtualbox'
brew cask install 'virtualbox-extension-pack'
brew cask install 'vagrant'

### archiving tools
brew cask install 'keka'
brew cask install 'the-unarchiver'

### text editing
brew cask install 'texshop'

### dev
# brew cask install 'android-studio'
brew cask install 'iterm2'
brew cask install 'android-file-transfer'
brew cask install 'charles'
brew cask install 'Dash3'
brew cask install 'viscosity'
# brew cask install 'gitx'


### splunking
brew install 'samdmarshall/formulae/aosd'
brew cask install '0xed'
brew cask install 'hex-fiend'
brew cask install 'hopper-disassembler'
brew cask install 'synalyze-it-pro'

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
brew cask install 'dropbox'
brew cask install '1password'
brew cask install 'alfred'
#
brew cask install 'caffeine'
brew cask install 'disk-inventory-x'
brew cask install 'fantastical'
brew cask install 'geektool'
brew cask install 'imagealpha'
brew cask install 'imageoptim'
brew cask install 'transmit'

### maths
brew cask install 'speedcrunch'

## debug
# brew tap 'homebrew/x11/'
# cd /usr/local/Library/Taps/homebrew/homebrew-x11/
# git remote set-url origin git@github.com:Homebrew/homebrew-x11/.git
brew install 'homebrew/dev-tools/brew-pry'
brew install 'gdb'
brew cask install 'macgdbp'
brew install 'homebrew/x11/ddd'
brew install 'ios-webkit-debug-proxy'
brew install 'iperf'

## filesystems
brew cask install 'osxfuse'
brew install 'homebrew/fuse/s3fs'
brew install 'homebrew/fuse/ntfs-3g'

### music
# https://github.com/thebitguru/play-button-itunes-patch
brew install 'homebrew/binary/libspotify'
brew cask install 'plug'
brew cask install 'rdio'
brew cask install 'soundcleod'
brew cask install 'spotify'

### freelance
brew cask install 'harvest'

### video manipulation
brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-frei0r \
--with-libass --with-libvo-aacenc --with-libvorbis --with-libvpx \
--with-opencore-amr --with-openjpeg --with-opus \
--with-rtmpdump --with-speex --with-theora --with-tools \
--with-libvorbis --with-theora
brew cask install 'youtube-dl'
# brew cask install 'subler'
# brew cask install 'miro-video-converter'

### theinternet
brew cask install 'transmission'
brew cask install 'lastfm'

### image manipulation
brew cask install 'xee'

### text manipulation
brew cask install 'calibre'

## Keyboard map
brew cask install 'karabiner'
brew cask install 'seil'
brew cask install 'ukelele'

### OSX hacks
brew cask install 'rcdefaultapp'
# brew cask install 'RightZoom'

### battery stuff
brew cask install 'slimbatterymonitor'
# brew cask install 'coconutbattery'


# color pickers
brew cask install colorpicker-developer --force
brew cask install colorpicker-propicker --force
brew cask install colorpicker-hex --force
brew cask install icolors --force

### OSX quicklook plugins
# see https://github.com/sindresorhus/quick-look-plugins
brew cask install 'betterzipql' --force
brew cask install 'ipaql' --force
brew cask install 'provisionql' --force
brew cask install 'qlcolorcode' --force
brew cask install 'qlimagesize' --force
brew cask install 'qlmarkdown' --force
brew cask install 'qlprettypatch' --force
brew cask install 'qlstephen' --force
brew cask install 'qlvideo' --force
brew cask install 'quicklook-json' --force
brew cask install 'quicklookapk' --force
brew cask install 'quicknfo' --force
brew cask install 'suspicious-package' --force
brew cask install 'webpquicklook' --force

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
# brew cask alfred link # no longer needed see https://github.com/caskroom/homebrew-cask/issues/8052#issuecomment-69560606

## brew aliases
# brew alias status='!git status'
# brew alias bump='upgrade'

### some brew cleanup
brew cleanup -s && brew prune
brew doctor

### I should get around talking about installing things on your machine

### current list of crap on my dev machine
# ~/code/andxyz-dotfiles[master]
# $ brew leaves | sort | paste - - - -
# ack adr-tools ansible ansible@1.9
# apm-bash-completion aptly-completion  autoenv awscli
# aykamko/tag-ag/tag-ag bash  bash-completion bash-git-prompt
# binutils  bundler-completion  bzip2 cargo-completion
# carthage  clang-format  consul  coreutils
# cowsay  cppcheck  ddd dirmngr
# elm faad2 fasd  ffmpeg
# findutils flac  flow  fpp
# fzf gawk  gcc gdb
# gem-completion  geoip gflags  ghc
# gifsicle  git gnu-getopt  gnu-indent
# gnu-sed gnu-tar gnu-which gnupg
# go@1.7  gpg-agent gradle  grep
# grunt-completion  gzip  haskell-stack heroku
# highlight homebrew/apache/ab  homebrew/php/composer homebrew/php/php56
# htop  httpie  hub hunspell
# ical-buddy  icdiff  iftop imagemagick
# imagesnap iperf jansson jenv
# jq  jsonpp  leiningen less
# libao libav libcue  libssh2
# libusb-compat libvo-aacenc  m-cli macvim
# mad man2html  mas maven-completion
# mercurial mitmproxy mongoose  mono
# moreutils mp4v2 multitail mycli
# mysql@5.5 mysql@5.6 ncurses nethogs
# netpbm  nginx nmap  nsq
# ntfs-3g openssh ossp-uuid p7zip
# packer  pandoc  pbzip2  perl
# pgcli phantomjs pick  pidcat
# pip-completion  postgresql  proctools psgrep
# pstree  pv  pyenv-virtualenv  python3
# qcachegrind r rails-completion  rake-completion
# reattach-to-user-namespace  rebar@3 recoverjpeg ripgrep
# rsync s3cmd s3fs  sdl
# shopify/shopify/toxiproxy speedtest-cli tcpflow terraform
# tig tldr  tmux  transmission
# trash tree  uncrustify  universal-ctags/universal-ctags/universal-ctags
# unrar v8  vagrant-completion  valgrind
# vbindiff  vim vips  watchman
# wget  wifi-password xctool  yarn
# youtube-dl  zlib  zsh zsh-completions
# zsh-syntax-highlighting

# $ brew cask list | sort | paste  - - - -
# alfred  android-file-transfer appcleaner  atom
# betterzipql blackscreen-screensaver calibre coconutbattery
# colorpicker-developer colorpicker-hex colorpicker-propicker controlplane
# diffmerge disk-inventory-x  dropbox geektool
# gitx  go2shell  google-hangouts harvest
# icolors jadengeller-helium  java  julia
# keka  lastfm  limechat  liteicon
# lunchy  macdown macgdbp mplayerx
# mumble  name-mangler  netnewswire osxfuse
# process-monitor provisionql qlcolorcode qlimagesize
# qlmarkdown  qlprettypatch qlstephen qlvideo
# quicklook-csv quicklook-json  quicklookapk  quicknfo
# rcdefaultapp  rightzoom sequel-pro  silverlight
# skype slimbatterymonitor  soundcleod  speedcrunch
# subler  suspicious-package  texshop the-unarchiver
# trailer transmission  ukelele vagrant
# virtualbox  visual-studio-code  webpquicklook xee
# xquartz yakyak

# $ mas list
# 430255202 Mactracker (7.6.6)
# 692867256 Simplenote (1.1.8)
# 526546615 Diptic (2.0.4)
# 409183694 Keynote (6.6.2)
# 417602904 CloudApp (4.2.5)
# 461369673 VOX (2.8.7)
# 808154494 Mail Notifr (1.3.5)
# 485812721 TweetDeck (3.9.889)
# 1082170746 Aware (1.0.3)
# 871200983 Gifwit (1.0.5)
# 409203825 Numbers (3.6.2)
# 497799835 Xcode (8.2.1)
# 847496013 Deckset (1.8.1)
# 409201541 Pages (5.6.2)
# 1199498204 Heartbeat (3.0.2)
# 777874532 Cinemagraph Pro (2.2)
# 928871589 Noizio (1.5)
# 549083868 Display Menu (2.2.2)
# 603637384 Name Mangler 3 (3.4)
# 704400176 gps4cam (7.8.2)
# 552792489 StatusClock (1.2)
# 1000397973 Wallcat (1.3.0)
# 492498910 Kitabu (1.1)
# 1081413713 GIF Brewery 3 (3.5)
# 445189367 PopClip (1.5.6)

 exit 0
