# andxyz .dotfiles

the pronunciation of .dotfiles is not lost on me


#### Getting up and running in a flash

The following is what I type on a new machine to get up and running (after I copy over my .ssh setting)

```bash

### prepare to max out the cpu
export env MYUSERNAME=andxyz
cd $HOME
git clone https://github.com/$MYUSERNAME/.dotfiles.git .dotfiles

### install homebrew stuff (lots of compiling)
brew bundle

### install my dotfiles (symlinking) should work now that homebrew stuff is installed
rake install

### change my shell to zsh (we need become root for a second, to add an extra shell)
brew install 'zsh'
sudo su -
echo /usr/local/bin/zsh >> /etc/shells
exit
chsh -s /usr/local/bin/zsh $MYUSERNAME

### add other language dependancy tools
git clone https://github.com/creationix/nvm.git ~/.nvm
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

```

## now I close this shell and open a new one

Let's install some other programming languages

```bash
### install other languages as needed
cd ~/.dotfiles/
chmod +x ./languages/*
./languages/go
./languages/haskell
./languages/java
./languages/nodejs
./languages/php
./languages/python
./languages/ruby
```