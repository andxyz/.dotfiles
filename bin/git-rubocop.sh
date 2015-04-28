#!/usr/bin/env bash

rubocop -c.hound.yml `git diff HEAD..master --name-only | grep -i .rb`
