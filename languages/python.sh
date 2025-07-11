#!/usr/bin/env bash

set -e
set -x

echo "install python stuff goes here"

# brew install python@2
# pip2 install --no-cache-dir --no-binary --upgrade virtualenv
# pip2 install --no-cache-dir --no-binary --upgrade pip
# pip2 install --no-cache-dir --no-binary --upgrade setuptools



brew install python@3.13

brew link python@3.13 --force brew link --overwrite python@3.13

python3 -m pip install --upgrade virtualenv
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade setuptools

brew install pipenv

# some tools
# uhhhhh sure I guess
brew install httpie pgcli mycli
# python3 -m pip install --upgrade paramiko
# python3 -m pip install --upgrade machobot https://github.com/rodionovd/machobot
# python3 -m pip install --upgrade mitmproxy

exit 0
