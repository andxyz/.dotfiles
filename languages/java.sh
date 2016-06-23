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
  'http://download.oracle.com/otn-pub/java/jdk/8u92-b14/jdk-8u92-macosx-x64.dmg' \
  --output /tmp/jdk-8u92-macosx-x64.dmg
open -a 'finder' /tmp/jdk-8u92-macosx-x64.dmg
# manually install it

brew update
brew install -vd jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
yes | jenv add /Library/Java/JavaVirtualMachines/*/Contents/Home/
jenv versions
jenv global oracle64-1.8.0.92
# jenv local oracle64-1.8.0.60

exit 0
