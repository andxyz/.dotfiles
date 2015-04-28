#!/usr/bin/env bash

list=`gem list --no-versions | uniq | sort`
for gem in $list; do
  gem uninstall $gem -aIx
done
gem list
gem install bundler
