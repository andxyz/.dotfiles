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

# ==============================
#  PRY BYEBUG https://github.com/deivid-rodriguez/pry-byebug
# ==============================
# Try to force pry-byebug
begin
  extra_gem_locations = []
  require 'bundler'
  Bundler.with_unbundled_env do
    # gem dependency pry-doc --version '>= 0.10'
    extra_gem_locations = %x{ dirname `gem which 'pry'` }
    extra_gem_locations << %x{ dirname `gem which 'niceql'` }
    extra_gem_locations << %x{ dirname `gem which 'pry-byebug'` }
    extra_gem_locations << %x{ dirname `gem which 'byebug'` }
  end
  # puts extra_gem_locations
  extra_gem_locations.split("\n").each do |gem_location|
    # puts gem_location
    $LOAD_PATH.unshift(File.join(File.dirname(gem_location), 'lib'))
  end
  # puts $LOAD_PATH
  ::Kernel.require('pry-byebug')
  ::Kernel.require('niceql')
rescue => e
  puts "oh well, maybe try rbenv exec gem install 'pry-byebug'"
  puts e.message if e.message
  puts e.cause if e.cause
  puts e.backtrace if e.backtrace
end

# Try to use Pry everywhere
begin
  require 'pry'
  Pry.start
  exit # exit once pry exits
rescue => e
  puts "oh well, try gem install 'pry-byebug'"
  puts e.message if e.message
  puts e.cause if e.cause
  puts e.backtrace if e.backtrace
end
