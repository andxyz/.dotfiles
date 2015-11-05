#!/usr/bin/env bash

simple_gem_list=$(gem list --no-versions | uniq | sort | tr  "\n" " ")
read -a gem_list <<< $simple_gem_list
for gem_name in ${gem_list[@]}; do
  gem uninstall $gem_name -aIx
done
gem list
gem install bundler
