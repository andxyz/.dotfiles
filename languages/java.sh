#!/usr/bin/env bash

set -e
set -x

echo "maybe checkout http://sdkman.io/"

## see http://docs.oracle.com/javase/7/docs/webnotes/install/mac/mac-jdk.html
## see https://docs.oracle.com/javase/8/docs/technotes/guides/install/mac_jdk.html#CHDBADCG
## downloads http://www.oracle.com/technetwork/java/javase/downloads/index.html
## see http://www.jenv.be/

echo "below we install and use jenv"

# download some version of java
curl -L \
  -b "oraclelicense=a" \
  'http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-macosx-x64.dmg' \
  --output /tmp/jdk-8u45-macosx-x64.dmg
open -a 'finder' /tmp/jdk-8u45-macosx-x64.dmg
# manually install it

brew update
brew install -vd jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
jenv add /System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home/
jenv add /Library/Java/JavaVirtualMachines/jdk1.8.0_11.jdk/Contents/Home/
jenv add /Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home/
jenv add /Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home/
jenv add /Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home/

yes | jenv add /Library/Java/JavaVirtualMachines/*/Contents/Home/
jenv versions
jenv global oracle64-1.8.0.60
# jenv local oracle64-1.8.0.31

exit 0
