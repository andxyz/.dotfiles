#!/usr/bin/env bash

set -e
set -x

## see http://docs.oracle.com/javase/7/docs/webnotes/install/mac/mac-jdk.html
## see https://docs.oracle.com/javase/8/docs/technotes/guides/install/mac_jdk.html#CHDBADCG
## downloads http://www.oracle.com/technetwork/java/javase/downloads/index.html
## see http://www.jenv.be/

echo "below we install and use jenv"

# download some version of java
# stole from chromes copy as curl functionality
open -b 'com.google.chrome' 'https://www.oracle.com/technetwork/java/javase/downloads/index.html'

open -a 'finder' /tmp/jdk-8u92-macosx-x64.dmg
open -a 'finder' ~/Downloads/jdk-13.0.1_osx-x64_bin.dmg

# now we manually install it, sad face

brew update
brew install -vd jenv


## bash
# which -a jenv > /dev/null && eval "$(jenv init -)"
## read zsh
jenv init - zsh

yes | jenv add /Library/Java/JavaVirtualMachines/*/Contents/Home/
# yes | jenv add /Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home
jenv versions
jenv global oracle64-13.0.1
# jenv global oracle64-1.8.0.161
# jenv global oracle64-1.8.0.131
# jenv local oracle64-1.8.0.60


exit 0
