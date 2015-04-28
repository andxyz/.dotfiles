#!/usr/bin/env bash
#
for INDEX_I in 1 2 3 4 5 .. 10
do
  open `curl -s http://corginator.herokuapp.com/random | jq --raw-output '.corgi'`
done
