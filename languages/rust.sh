#!/usr/bin/env bash

set -e
set -x

echo "install rust stuff goes here"
# https://www.rustup.rs/, default folder is $HOME/.rustup
open -b 'com.google.chrome' 'https://www.rustup.rs/'

curl https://sh.rustup.rs -sSf | sh

source $HOME/.cargo/env

rustup self update
rustup update stable-x86_64-apple-darwin
rustup default stable-x86_64-apple-darwin
rustup which cargo
rustc --version

# specific to my andxyz setup
# rustup completions zsh > ~/.zsh/functions/_rustup

## install a beta (but dont set as default)
rustup install beta-x86_64-apple-darwin
rustup update beta-x86_64-apple-darwin

exit 0
