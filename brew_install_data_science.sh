#!/usr/bin/env bash
#
# dont just run this file

set -x
set -e

## house cleaning round 1
brew update
brew cleanup -s
# brew prune
brew outdated

## crazy data science tools
## the following will install python2 python3 R julia and lua
brew install python3 --framework

brew cask install xquartz
brew cask install anaconda
brew cask install r
## example cool bundler command: R -e 'chooseCRANmirror(graphics=FALSE, ind=87);library(rbundler);bundle()'
## see http://stackoverflow.com/questions/11488174/how-to-select-a-cran-mirror-in-r
## and choose from https://cran.r-project.org/mirrors.html
hash -r
R -e 'install.packages("Rserve", repos="http://cran.utstat.utoronto.ca/", type="source")' && \
R -e 'install.packages("ggplot2", repos="http://cran.utstat.utoronto.ca/", type="source")' && \
R -e 'install.packages("devtools", repos="http://cran.utstat.utoronto.ca/", type="source")' && \
R -e 'install.packages("RCurl", repos="http://cran.utstat.utoronto.ca/", type="source")' && \
R -e 'install.packages("RJSONIO", repos="http://cran.utstat.utoronto.ca/", type="source")' && \
R -e 'install.packages("jpeg", repos="http://cran.utstat.utoronto.ca/", type="source")' && \
R -e 'install.packages("png", repos="http://cran.utstat.utoronto.ca/", type="source")' && \
R -e 'install.packages("base64enc", repos="http://cran.utstat.utoronto.ca/", type="source")'
brew install zeromq
### julia
brew cask install julia
hash -r
### lua
brew install lua
brew install luajit
luarocks install luajson

### conda things
conda create -n py3k python=3 anaconda
conda install pyzmq --yes

### try beaker
brew cask install beaker

## try jupyter
conda install jupyter --yes
conda update jupyter --yes
conda install ipython
conda install -c ipython-notebook --yes
# Native R kernel for Jupyter
conda install -c r r-irkernel --yes

## try python3 with anaconda
brew cask install anaconda
conda create -n py3k python=3 anaconda

### some brew cleanup
brew cleanup -s
brew doctor
