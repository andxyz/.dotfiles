# run this file with 
##### `cd ~/.dotfiles && brew bundle`

### andxyz.com Brewfile https://github.com/andxyz/.dotfiles/blob/master/Brewfile
### I should get around to putting some of https://gist.github.com/9393431 in a cask

### first off, update all brew installed crap
update
upgrade

## LETS COMPILE STUFF

### db
install 'redis'
install 'mysql'
install 'postgresql'

### vcs
install 'git'
install 'hub'
install 'kaleidoscope'
### other vcs
install 'hg'
install 'svn'

### gnu userland utils
install 'coreutils findutils gnu-indent gnu-sed gnu-grep gnu-tar gawk'

### 3rd-party-toolkits
install 'heroku'

### languages
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap josegonzalez/homebrew-php
#### you should read the following for php
##### `brew options php54`
##### `brew install php54`
##### `brew options php55`
##### `brew info php55`
##### `browser http://justinhileman.info/article/reinstalling-php-on-mac-os-x/`
##### `browser blog.frd.mn/install-nginx-php-fpm-mysql-and-phpmyadmin-on-os-x-mavericks-using-homebrew/`

brew install php54 --homebrew-apxs --with-fpm --with-homebrew-openssl --with-mysql --with-pgsql 



### addons to the addons?
install 'imagemagick'

## LETS INSTALL SOME BINARIES
#### see https://github.com/phinze/homebrew-cask/tree/master/Casks for more

tap 'phinze/cask'
install 'brew-cask'

### coding
cask install 'sublime-text'
##### `brew cask install 'sublimetext2'`
##### `brew cask install 'sublimetext3'`

### vms
cash install 'virtualbox'

### productivity?
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
cash install 'xee'

### OSX hacks
cask install 'ukelele'
cask install 'pckeyboardhack'
cask install 'rcdefaultapp'

### link up the folder, so alfred can see the apps
cask alfred link


### some brew cleanup
cleanup
