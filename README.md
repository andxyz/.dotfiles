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

exit
```

## Take a breath as zsh takes over
now I close the current shell and open a new one

## Time to install some programming languages

```bash
### install other languages as needed
cd ~/.dotfiles/
chmod +x ./languages/*
# ./languages/go todo
# ./languages/haskell todo
# ./languages/java todo
./languages/nodejs
./languages/php
# ./languages/python todo
./languages/ruby
```


## andxyz personal sublime text plugins

```
git clone git@github.com:andxyz/sublime-text-2-configs.git ~/temp-sublime-text-2-configs
mv ~/temp-sublime-text-2-configs/.git ~/Library/Application\ Support/Sublime\ Text\ 2/.git
rm -rf ~/temp-sublime-text-2-configs
cd ~/Library/Application\ Support/Sublime\ Text\ 2/
git checkout --force master
```




