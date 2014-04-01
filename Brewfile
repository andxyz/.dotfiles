# run this file with 
##### `cd ~/.dotfiles && brew bundle`

### andxyz.com Brewfile https://github.com/andxyz/.dotfiles/blob/master/Brewfile
### I should get around to putting some of https://gist.github.com/9393431 in a cask

### first off, update all brew installed crap
update
upgrade

#### enable binary downloads see https://github.com/phinze/homebrew-cask/tree/master/Casks for more
tap 'phinze/cask'
install 'brew-cask'

## LETS COMPILE STUFF

### shell
install 'zsh'
### version control systems
install 'git'
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
cask install 'sublime-text'
##### `brew cask install 'sublimetext2'`
##### `brew cask install 'sublimetext3'`

### vms
cask install 'virtualbox'

### productivity?
cask install 'autoenv'
cask install 'geektool'
cask install 'alfred'
cask install 'fantastical'

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
cask install 'pckeyboardhack'
cask install 'rcdefaultapp'

### link up the folder, so alfred can see the apps
cask alfred link


### some brew cleanup
cleanup



