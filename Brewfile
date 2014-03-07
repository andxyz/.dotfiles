# andxyz.com Brewfile https://github.com/andxyz/.dotfiles/blob/master/Brewfile
# I should get around to putting some of https://gist.github.com/9393431 in a cask


## first off, update all brew installed crap
update
upgrade


## LETS COMPILE STUFF

## db
install 'redis'
install 'mysql'
install 'postgresql'

## vcs
install 'git'
install 'hub'
install 'Kaleidoscope'
## other vcs
install 'hg'
install 'svn'

## gnu userland utils
install 'coreutils findutils gnu-indent gnu-sed gnu-grep gnu-tar gawk'

## 3rd-party-toolkits
install 'heroku'

## languages
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap josegonzalez/homebrew-php
# you should read the following
# brew options php54
brew install php54 --homebrew-apxs --with-fpm --with-homebrew-openssl --with-mysql --with-pgsql 
## see http://justinhileman.info/article/reinstalling-php-on-mac-os-x/
# brew install php54
# brew options php55
# brew info php55

## addons to the addons?
install 'imagemagick'



## LETS INSTALL SOME BINARIES
# see https://github.com/phinze/homebrew-cask/tree/master/Casks for more

tap 'phinze/cask'
install 'brew-cask'

## coding
cask install 'sublime-text'
# cask install 'sublime-text2'
# cask install 'sublime-text3'

## productivity?
cask install 'geektool'
cask install 'alfred'
cask install 'fantastical'

## 3rd-party-plugins
cask install 'silverlight'

## video chat
cask install 'skype'
cask install 'google-hangouts'
#text chat
cask install 'hipchat'
#cask install 'slack'
#cask install 'propane'

## music
cask install 'rdio'

## ios
# cask install 'reveal'
# cask install 'reflector'

## work
cask install 'harvest'

## link up the stuff
cask alfred link



## some brew cleanup
cleanup
