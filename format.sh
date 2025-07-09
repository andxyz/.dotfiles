#!/usr/bin/env bash

find . -iname '*.sh' -exec shellcheck {} \;

find . -iname '*.rb' -exec rubocop {} \;
