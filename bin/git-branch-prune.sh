#!/bin/sh
# Usage: git-branch-prune
# Delete all merged branches.

# prune github and local
# git remote prune origin && git branch --merged | grep -v "\*" | grep -v master | xargs -n 1 git branch --delete

git remote prune --dry-run origin &&
git branch --merged | grep -v "\*" | grep -v master | xargs -n 1 echo " * [would delete local branch]"
