#!/usr/bin/env bash

set -e
set -x

## see http://docs.oracle.com/javase/7/docs/webnotes/install/mac/mac-jdk.html
## see https://docs.oracle.com/javase/8/docs/technotes/guides/install/mac_jdk.html#CHDBADCG
## downloads http://www.oracle.com/technetwork/java/javase/downloads/index.html
## see http://www.jenv.be/

echo "below we install and use jenv"

# download some version of java
curl -L \
  -b "oraclelicense=a" \
  'http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-macosx-x64.dmg?AuthParam=1495564463_cd4fee31aa94429c58e204437c4f4735' \
  --output /tmp/jdk-8u92-macosx-x64.dmg
open -a 'finder' /tmp/jdk-8u92-macosx-x64.dmg
# manually install it

brew update
brew install -vd jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
yes | jenv add /Library/Java/JavaVirtualMachines/*/Contents/Home/
yes | jenv add /Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home
jenv versions
jenv global oracle64-1.8.0.131
# jenv local oracle64-1.8.0.60

sdkmad_repl_stuff() {
  echo "maybe checkout http://sdkman.io/"
  export SDKMAN_DIR="$HOME/.sdkman" && source "$HOME/.sdkman/bin/sdkman-init.sh"
  sdk selfupdate force
  sdk install groovy
  # groovysh
}

exit 0
