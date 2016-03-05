# andxyz .dotfiles

the pronunciation of .dotfiles is not lost on me

#### Getting up and running in a flash

The following is what I type on a new machine to get up and running (after I copy over my .ssh setting)

```shell
### prepare to max out the cpu
export -- MYUSERNAME=andxyz
cd $HOME
git clone https://github.com/$MYUSERNAME/.dotfiles.git .dotfiles

### install homebrew stuff (lots of compiling)
cd $HOME/.dotfiles/
bash -x brew_install_stuff.sh

### install my dotfiles (via symlinking)
### (this should work cleanly now that the homebrew stuff is installed)
rake install --trace

### change my shell to zsh
### (we need to become root for a second, to add an extra shell)
brew install 'zsh'
sudo su -
echo /usr/local/bin/zsh >> /etc/shells
exit
chsh -s /usr/local/bin/zsh $MYUSERNAME

exit
```

#### Take a breath as zsh takes over

now I close the current shell and open a new one

#### Time to install some programming languages

```shell
### install other languages as needed
cd ~/.dotfiles/
chmod +x ./languages/*
# ./languages/clojure.sh todo
# ./languages/go.sh todo
# ./languages/haskell.sh todo
./languages/java.sh
./languages/nodejs.sh
./languages/perl.sh
./languages/php.sh
./languages/python.sh
./languages/ruby.sh
```

#### andxyz personal sublime text plugins

#todo http://github.com/andxyz/sublime-text-3-configs
see http://github.com/andxyz/sublime-text-2-configs

```
git clone git@github.com:andxyz/sublime-text-2-configs.git ~/temp-sublime-text-2-configs
mv ~/temp-sublime-text-2-configs/.git ~/Library/Application\ Support/Sublime\ Text\ 2/.git
rm -rf ~/temp-sublime-text-2-configs
cd ~/Library/Application\ Support/Sublime\ Text\ 2/
git checkout --force master
```

#### iterm2 notes

- https://github.com/mbadolato/iTerm2-Color-Schemes#installation-instructions for importing color schemes
- `/Users/andxyz/code/andxyz-dotfiles/inputrc`
