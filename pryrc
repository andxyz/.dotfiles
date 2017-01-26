#!/usr/bin/env ruby

# See https://github.com/pry/pry/wiki/Customization-and-configuration
# load this file please
Pry.config.should_load_rc = true

# config history file
Pry.config.history.file = "#{ENV['HOME']}/.irb_history"

# config editor
Pry.config.editor = "subl -w"

# Pry.commands.alias_command 'cc', 'continue'
# Pry.commands.alias_command 'ss', 'step'
# Pry.commands.alias_command 'nn', 'next'

# ==============================
# nicer table printing
# ==============================
# RAILS_USE_HIRB_GEM=true RAILS_PRINT_X_COLUMNS=12 bundle exec rails console
if ENV['RAILS_USE_HIRB_GEM'] == "true" && defined?(::Rails) && Rails.env
  begin
    hirb_gem_location = ''
    Bundler.with_clean_env do
      hirb_gem_location = %x{ dirname `gem which hirb` }
    end
    # puts hirb_gem_location
    $LOAD_PATH.unshift(File.join(File.dirname(hirb_gem_location), 'lib'))
    # puts $LOAD_PATH
    ::Kernel.require('hirb')

    if defined? Hirb
      def hirb_enable_fancy_print
        old_print = Pry.config.print
        Pry.config.print = proc do |*args|
          Hirb::View.view_or_page_output(args[1]) || old_print.call(*args)
        end
      end

      def hirb_enable_fancy_print_options
        Hirb.enable({
          :width => (ENV.fetch('RAILS_PRINT_X_COLUMNS', 6).to_i * 35),
          :height => 500,
          output:
            ActiveRecord::Base.descendants.each_with_object({}) do |klass_name, tmp_hash|
              tmp_hash[klass_name.to_s] = { options: { fields: klass_name.column_names.take(ENV.fetch('RAILS_PRINT_X_COLUMNS', 6).to_i) | %w{created_at updated_at} } } rescue next
            end
        })
      end

      Hirb.enable()
      hirb_enable_fancy_print
      hirb_enable_fancy_print_options

      # pp Hirb::View.config

      # RAILS_USE_HIRB_GEM=true RAILS_PRINT_X_COLUMNS=12 bundle exec rails console
      # Golf::Event.limit(2)
      # RAILS_USE_HIRB_GEM=true RAILS_PRINT_X_COLUMNS=16 bundle exec rails console
      # Baseball::Event.limit(2)
    end

  rescue => e
    # oh well
    puts e.message if e.message
    puts e.cause if e.cause
    puts e.backtrace if e.backtrace
  end
end

# ==============================
#   Rails
# ==============================
if Kernel.const_defined?(:Rails) && ::Rails.env
  begin
    require File.join(Rails.root,"config","environment")
    require 'rails/console/app'
    require 'rails/console/helpers'
    extend Rails::ConsoleMethods
    puts 'Rails Console Helpers loaded'
  rescue LoadError => e
    require "console_app"
    require "console_with_helpers"
  end

  ## https://github.com/travisjeffery/dotfiles/blob/master/.railsrc
  require 'logger'

  def enable_logger
    ::ActiveRecord::Base.logger = Logger.new(STDOUT)
    ::ActiveRecord::Base.clear_active_connections!
    nil
  end

  def disable_logger
    ::ActiveRecord::Base.logger = nil
    ::ActiveRecord::Base.clear_active_connections!
    nil
  end

  # prints nice information about a model
  def show_model(object)
    y object.class == Class ? object.column_names.sort : object.class.column_names.sort
  end

  def show_tables
    y ::ActiveRecord::Base.connection.tables
  end

  # I use this one to dig into Rails core_ext
  class Class
    def core_ext
      self.instance_methods.map {|m| [m, self.instance_method(m).source_location] }.select {|m| m[1] && m[1][0] =~/activesupport/}.map {|m| m[0]}.sort
    end
  end

  # Hit all models for auto-completion
  ::ActiveRecord::Base.connection.tables.each {|t| t.singularize.classify.constantize rescue nil }

  # logging into console by default
  enable_logger
end

puts "Ruby #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"

puts "Loaded pryrc"
