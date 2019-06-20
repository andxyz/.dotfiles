#!/usr/bin/env bash

set -e
set -x

echo "install rust stuff goes here"
# https://www.rustup.rs/, default folder is $HOME/.rustup
open -b 'com.google.chrome' 'https://www.rustup.rs/'

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

source $HOME/.cargo/env

rustup self update
rustup update stable-x86_64-apple-darwin
rustup default stable-x86_64-apple-darwin
# info: using existing install for 'stable-x86_64-apple-darwin'
# info: default toolchain set to 'stable-x86_64-apple-darwin'
#   stable-x86_64-apple-darwin unchanged - rustc 1.35.0 (3c235d560 2019-05-20)
rustup which cargo
rustc --version

# specific to my andxyz setup
# rustup completions zsh > ~/.zsh/functions/_rustup

## install a beta (but dont set as default)
# rustup install beta-x86_64-apple-darwin
# rustup update beta-x86_64-apple-darwin

# read some more
# https://doc.rust-lang.org/book/
# rustup docs --book

exit 0
