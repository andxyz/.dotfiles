#!/usr/bin/env bash

set -e
set -x

echo "install python stuff goes here"

brew install python --framework
pip2 install --upgrade pip setuptools
pip install --no-cache-dir --no-binary --upgrade virtualenv

# brew install python3 --framework
# pip3 install --no-cache-dir --no-binary --upgrade virtualenv

# uhhh sure
pip install --no-cache-dir --no-binary --upgrade httpie
pip install --no-cache-dir --no-binary --upgrade pgcli
pip install --no-cache-dir --no-binary --upgrade mycli
pip install --no-cache-dir --no-binary --upgrade paramiko
pip install --no-cache-dir --no-binary --upgrade machobot
pip install --no-cache-dir --no-binary --upgrade mitmproxy
# aws repl
pip install --no-cache-dir --no-binary --upgrade git+https://github.com/awslabs/aws-shell --upgrade six
# docker repl
pip install --no-cache-dir --no-binary --upgrade git+https://github.com/j-bennet/wharfee.git --upgrade six
# kube repl
pip install --no-cache-dir --no-binary --upgrade git+https://github.com/cloudnativelabs/kube-shell --upgrade six

exit 0
