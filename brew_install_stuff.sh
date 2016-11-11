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
# find ~/Applications -lname '/opt/*' -exec sh -c 'ln -sf "$(readlink "$0" | sed s:^/opt/homebrew\-cask/:/usr/local/:g)" "$0"' {} \;
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
brew tap 'homebrew/binary'
brew tap 'homebrew/bundle'
brew tap 'homebrew/completions'
brew tap 'homebrew/dev-tools'
brew tap 'homebrew/dupes'
brew tap 'homebrew/fuse'
brew tap 'homebrew/php'
brew tap 'homebrew/python'
brew tap 'homebrew/nginx'
brew tap 'homebrew/science'
brew tap 'homebrew/services'
brew tap 'homebrew/tex'
brew tap 'homebrew/versions'
brew tap 'universal-ctags/universal-ctags'
brew tap 'samdmarshall/formulae'
brew untap 'josegonzalez/php'

## house cleaning round 2
brew update
brew upgrade brew-cask
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
brew install 'git' --with-pcre --with-brewed-curl --with-brewed-openssl
#brew upgrade 'git' --with-pcre --with-brewed-curl --with-brewed-openssl
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
brew install 'grep' # gnu grep is in homebrew/dupes
brew install 'gzip'
brew install 'less'

brew install 'htop' # brew upgrade 'htop'
sudo chown root:wheel `which htop`
sudo chmod u+s `which htop`

### 3rd-party-toolkits
brew install 'ical-buddy'
brew install 'heroku'

### languages
### see https://github.com/andxyz/.dotfiles/tree/master/languages
brew install 'rust'
brew link 'rust' --force --overwrite || true

### language checkers
brew install 'cppcheck'
brew install 'clang-format'
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

### http tools
brew install 'httpie'
brew install 'homebrew/apache/ab'
brew install 'jq'

### web servers
## nginx
#brew options nginx-full
#brew info nginx-full
#brew install nginx-full --with-upload-module

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
brew cask install 'geektool'
brew cask install 'alfred'
brew cask install 'fantastical'
brew cask install 'dropbox'
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
# brew cask alfred link # no longer needed see https://github.com/caskroom/homebrew-cask/issues/8052#issuecomment-69560606

## brew aliases
# brew alias status='!git status'
# brew alias bump='upgrade'

### some brew cleanup
brew cleanup -s && brew prune
brew doctor

### I should get around talking about installing things on your machine

### current list of crap on my dev machine
# ~/code/andxyz-dotfiles[master]$ brew leaves | sort | paste - - - -
# ack autoenv awscli  aykamko/tag-ag/tag-ag
# bash  bash-completion bash-git-prompt bfg
# carthage  coreutils cppcheck  ctags
# curl  elm ffmpeg  findutils
# flow  fzf gawk  gcc
# gdb geoip gifsicle  git
# gnu-getopt  gnu-indent  gnu-sed gnu-tar
# gnu-which gnupg gnupg2  gradle
# graphviz  haskell-stack heroku  highlight
# homebrew/apache/ab  homebrew/boneyard/samba homebrew/completions/bundler-completion homebrew/completions/cargo-completion
# homebrew/completions/gem-completion homebrew/completions/grunt-completion homebrew/completions/maven-completion homebrew/completions/pip-completion
# homebrew/completions/rails-completion homebrew/completions/rake-completion  homebrew/completions/vagrant-completion homebrew/dupes/bzip2
# homebrew/dupes/grep homebrew/dupes/gzip homebrew/dupes/less homebrew/dupes/openssh
# homebrew/dupes/zlib homebrew/fuse/ntfs-3g homebrew/fuse/s3fs  homebrew/php/composer
# homebrew/php/php56  homebrew/science/r  homebrew/science/vips homebrew/versions/llvm35
# htop  httpie  hub hunspell
# ical-buddy  iftop imagemagick ios-webkit-debug-proxy
# iperf jenv  jq  jsonpp
# leiningen libav libvo-aacenc  libxslt
# libyaml luajit  macvim  man2html
# mas mercurial mitmproxy mongoose
# mono  multitail mysql nginx
# ninja nmap  nsq opam
# ossp-uuid pandoc  parallel  pbzip2
# phantomjs pick  pidcat  postgresql
# proctools psgrep  pstree  pv
# pyenv-virtualenv  python3 recoverjpeg ripgrep
# s3cmd sdl speedtest_cli subversion
# swig  tcpflow tig tldr
# tmux  transmission  trash tree
# uncrustify  universal-ctags/universal-ctags/universal-ctags unrar v8
# watchman  wget  xctool  yarn
# youtube-dl  zsh zsh-completions zsh-syntax-highlighting

# ~/code/andxyz-dotfiles[master]$ brew cask list  | sort | paste - - - -
# alfred  anaconda  android-file-transfer beaker
# betterzipql calibre coconutbattery  colorpicker-developer
# colorpicker-hex colorpicker-propicker controlplane  disk-inventory-x
# dropbox geektool  gitx  go2shell
# google-hangouts harvest icolors jadengeller-helium
# java  julia keka  lastfm
# limechat  lunchy  macdown macgdbp
# macvim  mplayerx  mumble  name-mangler
# netnewswire osxfuse pgweb provisionql
# qlcolorcode qlimagesize qlmarkdown  qlprettypatch
# qlstephen quicklook-csv quicklook-json  quicknfo
# rcdefaultapp  rightzoom sequel-pro  silverlight
# skype slimbatterymonitor  soundcleod  speedcrunch
# suspicious-package  texshop the-unarchiver  transmission
# ukelele vagrant virtualbox  webpquicklook
# xee xquartz yakyak
