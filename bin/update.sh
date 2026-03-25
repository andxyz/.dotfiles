#!/usr/bin/env bash

set -ex

bundle update --bundler
bundle update --ruby
bundle update --all

exit 0
