#!/usr/bin/env ruby

# See https://github.com/pry/pry/wiki/Customization-and-configuration
# load this file please
Pry.config.should_load_rc = true

# config history file
Pry.config.history.file = "#{ENV['HOME']}/.irb_history"

# config editor
Pry.config.editor = "subl -w"

# nicer printing
require 'Hirb'
begin
  old_print = Pry.config.print
  Pry.config.print = proc do |*args|
    Hirb::View.view_or_page_output(args[1]) || old_print.call(*args)
  end
rescue Exception => e
  puts e
end
