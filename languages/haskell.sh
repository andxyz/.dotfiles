#!/usr/bin/env bash

set -ex

brew install ghcup
# brew install cabal-install # https://www.haskell.org/cabal/
# brew install haskell-stack # https://docs.haskellstack.org/en/stable/

# list available ghc/cabal versions
ghcup list

ghcup install ghc 9.4.8
ghcup set ghc 9.4.8

ghcup install cabal 3.10.3.0
ghcup set cabal 3.10.3.0

# update ghcup itself
ghcup upgrade

cabal install --overwrite-policy=always pandoc-cli

test -d "$HOME/.ghcup/bin/" && export -- PATH="$HOME/.ghcup/bin/:${PATH}"
test -d "$HOME/.local/bin/" && export -- PATH="$HOME/.local/bin/"

exit 0
