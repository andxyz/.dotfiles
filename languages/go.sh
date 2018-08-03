#!/usr/bin/env bash

set -ex

brew install go@1.10
# golang https://golang.org/doc/install or `brew install go`
export -- GOPATH=$HOME/code/gowork
export -- PATH=$PATH:/usr/local/go/bin
export -- PATH=${PATH}:${GOPATH}/bin
## Note: GOROOT must be set only when installing to a custom location.
#export GOROOT=$HOME/go
#export PATH=$PATH:$GOROOT/bin

exit 0
