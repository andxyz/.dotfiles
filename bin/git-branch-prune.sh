#!/bin/sh
# Usage: git-branch-prune
# Delete all merged branches.

# prune local
# git branch --merged | grep -v "\*" | xargs -n 1 git branch --delete

# prune github and local
git remote prune origin && git branch --merged | grep -v "\*" | grep -v master | xargs -n 1 git branch --delete
