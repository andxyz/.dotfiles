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
puts "Loaded irbrc"

begin
  require 'awesome_print'
rescue LoadError
end

begin
  require 'pry'
  Pry.start
rescue LoadError
end

exit
