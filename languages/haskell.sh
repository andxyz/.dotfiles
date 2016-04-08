#!/usr/bin/env bash

set -ex

brew install cabal-install
brew install haskell-stack
cabal update

test -d "$HOME/.cabal/bin" &&
export -- PATH="$HOME/.cabal/bin:$PATH"

exit 0
