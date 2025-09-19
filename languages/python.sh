#!/usr/bin/env bash

set -e
set -x

echo "install python stuff goes here"

# brew install python@2
# pip2 install --no-cache-dir --no-binary --upgrade virtualenv
# pip2 install --no-cache-dir --no-binary --upgrade pip
# pip2 install --no-cache-dir --no-binary --upgrade setuptools

brew install python@3 && brew upgrade python@3
brew link python@3 --force
brew link --overwrite python@3
brew install uv && brew upgrade uv

brew install virtualenv && brew upgrade virtualenv
brew install pipx && brew upgrade pipx

# some tools
# uhhhhh sure I guess
brew install httpie pgcli mycli
# python3 -m pip install --upgrade mitmproxy

exit 0
