#!/usr/bin/env ruby

# See https://github.com/pry/pry/wiki/Customization-and-configuration
# load this file please
Pry.config.should_load_rc = true

# config hist
Pry.config.history.file = "#{ENV['HOME']}/.irb_history"

# config editor
Pry.config.editor = "subl -w"

# nicer printing
require "awesome_print"
AwesomePrint.pry!
