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

puts "Loaded irbrc"

begin
  require 'awesome_print'
rescue LoadError
end

# ==============================
#  PRY
# ==============================
# force pry
if ENV['RAILS_USE_PRY_GEM'] == "true"
  begin
    pry_gem_location = ''
    Bundler.with_clean_env do
      pry_gem_location = %x{ dirname `gem which pry` }
    end
    # puts pry_gem_location
    $LOAD_PATH.unshift(File.join(File.dirname(pry_gem_location), 'lib'))
    # puts $LOAD_PATH
    ::Kernel.require('pry')
  rescue => e
    # oh well
    puts e.message if e.message
    puts e.cause if e.cause
    puts e.backtrace if e.backtrace
  end
end
# Try to use Pry everywhere
begin
  require 'pry'
  Pry.start
rescue LoadError
end

exit
