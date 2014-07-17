# run this file with 
##### `cd ~/.dotfiles && brew bundle`

### andxyz.com Brewfile https://github.com/andxyz/.dotfiles/blob/master/Brewfile
### I should get around to putting some of https://gist.github.com/9393431 in a cask

### next is a list of current crap on my development machine
###### antiword cscope ghc jbig2dec lynx phantomjs sqlite apple-gcc42 ctags ghostscript jpeg macvim php54 subversion autoconf dnsmasq git jq mad pkg-config texi2html autoenv duti glib lame maven pngquant the_silver_searcher automake exif gnu-indent libao mercurial popt tree bind exiftool gnu-sed libcue mongodb postgresql unixodbc brew-cask faac gnu-tar libexif mongoose python webkit2png browser faad2 go libffi mp4v2 qt wkhtmltopdf browsertime ffmpeg graphviz libogg multitail rbenv x264 chromedriver findutils grc libpng mysql rbenv-gem-rehash xvid cloc flac haskell-platform libsass nginx readline xz cmus freetype heroku-toolbelt libtiff openssl redis yasm composer gawk htop-osx libtool ossp-uuid ruby-build zlib coreutils gdbm hub libvorbis pcre sassc zsh cppcheck gettext imagemagick little-cms2 perl518 sitespeed.io zsh-completions

### first off, update all brew installed crap we already have before going forward
update
upgrade

#### enable binary downloads see https://github.com/phinze/homebrew-cask/tree/master/Casks for more
tap 'phinze/cask'
install 'brew-cask'

## LETS COMPILE STUFF

### shell
install 'zsh'
### version control systems
install git --with-pcre
install 'hub'
# cask install 'kaleidoscope' ## i've been doing it manually
### db
install 'mysql'
install 'postgresql'
install 'redis'
### other vcs
install 'hg'
install 'svn'

### gnu userland utils
tap homebrew/dupes
install 'coreutils'
install 'findutils'
install 'gnu-indent'
install 'gnu-sed'
install 'grep' # gnu grep is in homebrew/dupes
install 'gnu-tar'
install 'gawk'

### 3rd-party-toolkits
install 'heroku'

### languages
### see https://github.com/andxyz/.dotfiles/tree/master/languages

### language checkers
install cppcheck
# use `npm install -g jshint` later

## LETS INSTALL SOME BINARIES

### coding
### `brew cask install 'sublime-text'`
### `brew cask install 'sublimetext2'`
### `brew cask install 'sublimetext3'`

### vms
cask install 'virtualbox'

### productivity?
cask install 'geektool'
cask install 'alfred'
cask install 'fantastical'

### archiving tools
cask install keka
cask install the-unarchiver

### text editing
cask install texshop

### 3rd-party-plugins
cask install 'silverlight'

### video chat
cask install 'skype'
cask install 'google-hangouts'
### text chat
cask install 'hipchat'
##### `brew cask install 'slack'`
##### `brew cask install 'propane'`

### music
cask install 'rdio'

### ios
##### `brew cask install 'reveal'`
##### `brew cask install 'reflector'`

### freelance
cask install 'harvest'

### video manipulation
cask install 'miro-video-converter'

### theinternet
cask install 'transmission'
cask install 'lastfm'

### image manipulation
cask install 'xee'

### text manipulation
cask install 'calibre'

### OSX hacks
cask install 'ukelele'
## nope cask install 'pckeyboardhack'
cask install 'rcdefaultapp'

### OSX quicklook plugins
cask install qlcolorcode
cask install qlstephen
cask install qlmarkdown
cask install quicklook-json
cask install qlprettypatch
cask install betterzipql
cask install webp-quicklook
cask install suspicious-package
cask install ipaql
# see https://github.com/sindresorhus/quick-look-plugins
# now run `defaults write com.apple.finder QLEnableTextSelection -bool true && killall Finder`

### link up the folder, so alfred can see the apps
cask alfred link


### some brew cleanup
cleanup



