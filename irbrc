#!/usr/bin/ruby
#require 'rubygems'
# require 'irb/completion'
# require 'irb/ext/save-history'
# require 'interactive_editor'
ARGV.concat ["--readline", "--prompt-mode", "simple"]

IRB.conf[:USE_READLINE] = true
IRB.conf[:SAVE_HISTORY] = 9999
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true

# Use Pry everywhere
require 'awesome_print'
require 'pry'
Pry.start
exit
