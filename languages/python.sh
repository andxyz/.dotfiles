#!/usr/bin/env bash

set -ex

echo "install python stuff goes here"

brew install python
### brew install python3
pip install --upgrade pip
pip install --upgrade virtualenv

exit 0
