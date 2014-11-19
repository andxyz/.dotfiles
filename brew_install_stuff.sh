#!/usr/bin/env bash
#
# run this file with
##### `cd ~/code/andxyz-dotfiles && ./brew_install_stuff.sh`

### I should get around to putting some of https://gist.github.com/9393431 in cask

### `brew list` old list of crap on my development machine
###### antiword cscope ghc jbig2dec lynx phantomjs sqlite apple-gcc42 ctags ghostscript jpeg macvim php54 subversion autoconf dnsmasq
###### git jq mad pkg-config texi2html autoenv duti glib lame maven pngquant the_silver_searcher automake exif gnu-indent
###### libao mercurial popt tree bind exiftool gnu-sed libcue mongodb postgresql unixodbc brew-cask faac gnu-tar libexif
###### mongoose python webkit2png browser faad2 go libffi mp4v2 qt wkhtmltopdf browsertime ffmpeg graphviz libogg
###### multitail rbenv x264 chromedriver findutils grc libpng mysql rbenv-gem-rehash xvid cloc flac haskell-platform
###### libsass nginx readline xz cmus freetype heroku-toolbelt libtiff openssl redis yasm composer gawk htop-osx libtool
###### ossp-uuid ruby-build zlib coreutils gdbm hub libvorbis pcre sassc zsh cppcheck gettext imagemagick little-cms2 perl518 sitespeed.io zsh-completions
### `brew list` old list of crap on my other development machine
###### ab      coreutils   findutils   gnu-indent    hub     libpng      mysql     pidcat      redis     unixodbc
###### ack     cppcheck    freetype    gnu-sed     icu4c     libtiff     nginx     pkg-config    s3cmd     v8
###### apr     cscope      gawk      gnu-tar     imagemagick   libtool     openssl     postgresql    sqlite      x264
###### apr-util    ctags     gdbm      gradle      jenv      libyaml     ossp-uuid   psgrep      subversion    xvid
###### beanstalk   curl      gettext     grep      jpeg      macvim      pandoc      pstree      the_silver_searcher xz
###### bfg     elasticsearch   gifsicle    heroku-toolbelt   jq      memcached   pcre      python      tldr      zlib
###### bison     faac      git     htop-osx    lame      mercurial   phantomjs   readline    transmission    zsh
###### brew-cask   ffmpeg      gmp     httpie      libevent    mitmproxy   php56     recoverjpeg   tree      zsh-completions

### first off, update all brew installed crap we already have before going forward
brew update
brew upgrade

#### enable binary downloads see https://github.com/phinze/homebrew-cask/tree/master/Casks for more
brew tap 'phinze/cask'
brew install 'brew-cask'

## LETS COMPILE STUFF

### shell
brew install 'zsh'
### version control systems
brew install git --with-pcre
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
tap homebrew/dupes
brew install 'coreutils'
brew install 'findutils'
brew install 'gnu-indent'
brew install 'gnu-sed'
brew install 'grep' # gnu grep is in homebrew/dupes
brew install 'gnu-tar'
brew install 'gawk'
brew install htop
sudo chown root:wheel `which htop`
sudo chmod u+s `which htop`


### 3rd-party-toolkits
brew install 'heroku'

### languages
### see https://github.com/andxyz/.dotfiles/tree/master/languages

### language checkers
brew install cppcheck
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
brew cask install keka
brew cask install the-unarchiver

### text editing
brew cask install texshop

### dev
brew cask install 'viscosity'
brew cask install 'android-studio'
brew cask install 'gitx'
brew cask install 'charles'
brew cask install 'android-file-transfer'
brew cask install 'Dash'

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
brew cask install 'soundcleod'
brew cask install 'plug'
brew cask install 'rdio'
brew cask install 'spotify'

### freelance
brew cask install 'harvest'

### video manipulation
brew cask install 'miro-video-converter'

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
brew cask install 'RightZoom'

### OSX quicklook plugins
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install qlprettypatch
brew cask install betterzipql
brew cask install webp-quicklook
brew cask install suspicious-package
brew cask install ipaql
# see https://github.com/sindresorhus/quick-look-plugins
# now run `defaults write com.apple.finder QLEnableTextSelection -bool true && killall Finder`

### link up the folder, so alfred can see the apps
brew cask alfred link

### some brew cleanup
brew cleanup
