#!/usr/bin/env bash

set -ex

echo "install java stuff goes here"
## see http://docs.oracle.com/javase/7/docs/webnotes/install/mac/mac-jdk.html
## see https://docs.oracle.com/javase/8/docs/technotes/guides/install/mac_jdk.html#CHDBADCG
## downloads http://www.oracle.com/technetwork/java/javase/downloads/index.html
## see http://www.jenv.be/

brew install jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
jenv add /System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home/
jenv add /Library/Java/JavaVirtualMachines/jdk1.8.0_11.jdk/Contents/Home/
jenv add /Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home/

jenv versions
jenv global oracle64-1.8.0.31
# jenv local oracle64-1.8.0.31

exit 0
