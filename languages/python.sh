#!/usr/bin/env bash

set -e
set -x

echo "install python stuff goes here"

brew install python --framework
### brew install python3 --framework
pip install --upgrade pip
pip install --upgrade virtualenv
pip install --upgrade paramiko
pip install --upgrade machobot
pip install --upgrade mitmproxy

exit 0
