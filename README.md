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
ruby -I./ -rdot_installer.rb --verbose

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
/languages/clojure.sh
/languages/elixir.sh
/languages/go.sh
/languages/haskell.sh
/languages/java.sh
/languages/nodejs.sh
/languages/perl.sh
/languages/php.sh
/languages/python.sh
/languages/ruby.sh
/languages/rust.sh
```

#### andxyz personal sublime text plugins

see http://github.com/andxyz/sublime-text-3-configs

```
git clone git@github.com:andxyz/sublime-text-3-configs.git ~/temp-sublime-text-3-configs
mv ~/temp-sublime-text-3-configs/.git ~/Library/Application\ Support/Sublime\ Text\ 3/.git
rm -rf ~/temp-sublime-text-3-configs
cd ~/Library/Application\ Support/Sublime\ Text\ 3/
git checkout --force master
```

#### iterm2 terminal notes

- https://github.com/mbadolato/iTerm2-Color-Schemes#installation-instructions for importing color schemes
- https://github.com/sonph/onehalf
- `/Users/andxyz/code/andxyz-dotfiles/inputrc`

### Ghostty

```shell
ghostty +list-themes
ghostty +list-fonts


# /Users/andxyz/Library/Application Support/com.mitchellh.ghostty/config
font-family = DejaVuSansM Nerd Font Mono
font-size = 16.5
window-padding-x = 2
theme = OneHalfDark
```
