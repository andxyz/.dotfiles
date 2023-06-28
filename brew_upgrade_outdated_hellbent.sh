#!/usr/bin/env bash

set -eufo pipefail

# june 2023

brew upgrade 'git' 'gh' 'git-delta'

brew upgrade 'ack' 'binutils' 'coreutils' 'curl' 'diffutils'
brew upgrade 'gawk' 'gnu-indent' 'gnutls' 'libxslt'
brew upgrade 'fzf' 'grep' 'htop' 'less'


brew cleanup -s
rm -rf $(brew --cache)
