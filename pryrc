#!/usr/bin/env ruby

# See https://github.com/pry/pry/wiki/Customization-and-configuration
# load this file please
Pry.config.should_load_rc = true

# config history file
Pry.config.history.file = "#{ENV['HOME']}/.irb_history"

# config editor
Pry.config.editor = "subl -w"

Pry.commands.alias_command 'cc', 'continue'
# Pry.commands.alias_command 'ss', 'step'
# Pry.commands.alias_command 'nn', 'next'

if defined?(::Rails) && Rails.env
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

# nicer table printing
if ENV['RAILS_USE_HIRB_GEM'] && defined?(::Rails) && Rails.env
# if defined?(::Rails) && Rails.env
  begin
    hirb_gem_location = ''
    Bundler.with_clean_env do
      hirb_gem_location = %x{ dirname `gem which hirb` }
    end
    # puts hirb_gem_location
    $LOAD_PATH.unshift(File.join(File.dirname(hirb_gem_location), 'lib'))
    # puts $LOAD_PATH
    ::Kernel.require('hirb')

    Hirb.enable({:width => 120, :height => 500,
      output: {
        "Hockey::Player" => { options: { fields: %w{id first_name last_name created_at updated_at} } },
        "Soccer::Event" => { options: { fields: %w{id first_name last_name created_at updated_at} } },
        "Rosetta::Keys" => { options: { fields: %w{id model_id last_name created_at updated_at} } },
      }
    })

    old_print = Pry.config.print
    Pry.config.print = proc do |*args|
      Hirb::View.view_or_page_output(args[1]) || old_print.call(*args)
    end
  rescue => e
    # oh well
    puts e.message if e.message
    puts e.cause if e.cause
    puts e.backtrace if e.backtrace
  end
end
