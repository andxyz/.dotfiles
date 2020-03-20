#!/usr/bin/env bash

set -ex

# brew install go@1.7
# brew install go@1.8
# brew install go@1.9
# brew install go@1.10
# brew install go@1.11
# brew install go@1.12
# brew install go@1.13
brew install go@1.14
# golang https://golang.org/doc/install or `brew install go`
export -- GOPATH=$HOME/code/gowork
export -- PATH=$PATH:/usr/local/go/bin
export -- PATH=${PATH}:${GOPATH}/bin
## Note: GOROOT must be set only when installing to a custom location.
#export GOROOT=$HOME/go
#export PATH=$PATH:$GOROOT/bin

exit 0
