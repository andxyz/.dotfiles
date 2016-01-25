#!/usr/bin/env ruby

# See https://github.com/pry/pry/wiki/Customization-and-configuration
# load this file please
Pry.config.should_load_rc = true

# config history file
Pry.config.history.file = "#{ENV['HOME']}/.irb_history"

# config editor
Pry.config.editor = "subl -w"

# nicer table printing
if ENV['RAILS_USE_HIRB_GEM'] && defined?(::Rails) && Rails.env
  begin
    require 'hirb'
    Hirb.enable({:width => 120, :height => 500,
      output: {
        "Hockey::Player": { options: { fields: %w{id first_name last_name updated_at} } }
      }
    })

    old_print = Pry.config.print
    Pry.config.print = proc do |*args|
      Hirb::View.view_or_page_output(args[1]) || old_print.call(*args)
    end
  rescue Exception => e
    ##oh well
    #puts e
  end
end
