#!/usr/bin/ruby
require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems'

IRB.conf[:USE_READLINE] = true
IRB.conf[:SAVE_HISTORY] = 9999
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true

begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError => err
end

require File.expand_path("~/.irb.d/all")

#
# This script comes from Pry Everywhere by Luca Pette
# http://lucapette.com/pry/pry-everywhere/
# https://github.com/carlhuda/bundler/issues/183#issuecomment-1149953
# 
# if defined?(::Bundler)
#   global_gemset = ENV['GEM_PATH'].split(':').grep(/ruby.*@global/).first
#   if global_gemset
#     all_global_gem_paths = Dir.glob("#{global_gemset}/gems/*")
#     all_global_gem_paths.each do |p|
#       gem_path = "#{p}/lib"
#       $LOAD_PATH << gem_path
#     end
#   end
# end
# 

# Use Pry everywhere
# require "rubygems"
# require 'pry'
# Pry.start
# exit
