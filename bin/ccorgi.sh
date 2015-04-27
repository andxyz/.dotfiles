#!/usr/bin/env bash
#
open `curl -s http://corginator.herokuapp.com/random | jq --raw-output '.corgi'`
