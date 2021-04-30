#!/usr/bin/env ruby

# frozen_string_literal: true

# See https://github.com/pry/pry/wiki/Customization-and-configuration
# load this file please
Pry.config.should_load_rc = true

# config history file
if Gem::Version.new(Pry::VERSION) >= Gem::Version.new('0.13.0')
  Pry.config.history_file = '~/.irb_history'
else
  Pry.config.history.file = '~/.irb_history'
end

# config editor
Pry.config.editor = 'subl -w'

# Pry.commands.alias_command 'cc', 'continue'
# Pry.commands.alias_command 'ss', 'step'
# Pry.commands.alias_command 'nn', 'next'

# ==============================
#  Helpers
# ==============================
#
require 'json'

def pp_json(object)
  if object.is_a?(String)
    puts JSON.pretty_generate(JSON.parse(object))
  elsif object.is_a?(JSON)
    puts JSON.pretty_generate(object)
  end
end

begin
  extra_gem_locations = []
  require 'bundler'
  Bundler.with_unbundled_env do
    extra_gem_locations << %x{ dirname `gem which 'niceql'` }
  end
  # puts extra_gem_locations
  extra_gem_locations.to_s.split("\n").each do |gem_location|
    # puts gem_location
    $LOAD_PATH.unshift(File.join(File.dirname(gem_location), 'lib'))
  end
  # puts $LOAD_PATH
  #
  ::Kernel.require('niceql')
rescue LoadError => e
  puts "oh well, maybe try rbenv exec gem install 'niceql'"
  puts e.message if e.message
  puts e.cause if e.cause
  # puts e.backtrace if e.backtrace
end

def pp_sql(object)
  if object.is_a?(String)
    puts ::Niceql::Prettifier.prettify_sql(object)
  end
end if defined?(::Niceql)

# ==============================
#   Rails
# ==============================
#
if Kernel.const_defined?(:Rails) && ::Rails.env
  begin
    # rails 4 -> rails 6
    require File.join(Rails.root, 'config', 'environment')
    require 'rails/console/app'
    require 'rails/console/helpers'
    extend Rails::ConsoleMethods
    puts 'Rails Console Helpers loaded'
  rescue LoadError => e
    # older rails < 4
    require 'console_app'
    require 'console_with_helpers'
    puts 'Rails Console Helpers loaded'
  rescue TypeError
    # sometimes files don't exist to require,
    # throwing TypeError: no implicit conversion of nil into String
    # just move on

    nil
  end

  ## https://github.com/travisjeffery/dotfiles/blob/master/.railsrc
  require 'logger'

  if defined?(::ActiveRecord)
    def pry_enable_logger
      ::ActiveRecord::Base.logger = Logger.new(STDOUT)
      ::ActiveRecord::Base.clear_active_connections!
      nil
    end

    def pry_disable_logger
      ::ActiveRecord::Base.logger = nil
      ::ActiveRecord::Base.clear_active_connections!
      nil
    end

    # prints nice information about a model
    def pry_show_model(object)
      if object.class == Class
        y object.column_names.sort
      else
        y object.class.column_names.sort
      end
    end

    def pry_show_tables
      y ::ActiveRecord::Base.connection.tables
    end

    # I use this one to dig into Rails core_ext
    class Class
      def core_ext
        instance_methods.map do |m|
          [m, instance_method(m).source_location]
        end.select do |m|
          m[1] && m[1][0] =~ /activesupport/
        end.map do |m|
          m[0]
        end.sort
      end
    end

    # Hit all models for auto-completion
    def pry_enable_autocomplete
      ApplicationRecord.descendants.each do |klass|
        klass.name.constantize.column_names
      rescue ActiveRecord::StatementInvalid => e
        # do nothing, rails is having trouble loading
      rescue StandardError => e
        puts "oh, okay then"
        puts e.class if e.class
        puts e.message if e.message
        puts e.cause if e.cause
        puts e.backtrace if e.backtrace
      end
    end

    # logging into console by default
    # pry_enable_logger
    # pry_enable_autocomplete
  end
end

# ==============================
#  PRY DOC https://github.com/pry/pry-doc
# ==============================
# Try to force pry-doc
#
# gem install 'pry-doc'
begin
  pry_doc_gem_locations = []
  require 'bundler'
  Bundler.with_unbundled_env do
    # gem dependency pry-doc --version '>= 0.10'
    pry_doc_gem_locations = %x(dirname `gem which 'pry-doc'`)
    pry_doc_gem_locations << %x(dirname `gem which 'yard'`)
  end
  # puts pry_doc_gem_locations
  pry_doc_gem_locations.split("\n").each do |gem_location|
    # puts gem_location
    $LOAD_PATH.unshift(File.join(File.dirname(gem_location), 'lib'))
  end
  # puts $LOAD_PATH
  ::Kernel.require('pry-doc')
rescue RunTimeError => e
  puts "oh well, try gem install 'pry-doc'"
  puts e.message if e.message
  puts e.cause if e.cause
  puts e.backtrace if e.backtrace
end

# ==============================
# nicer table printing
# ==============================
# env RAILS_USE_HIRB_GEM=true RAILS_PRINT_X_COLUMNS=12 bundle exec rails console
# env RAILS_USE_HIRB_GEM=true RAILS_PRINT_X_COLUMNS=12 bundle exec rescue rspec
if ENV['RAILS_USE_HIRB_GEM'] == 'true' && defined?(::Rails) && Rails.env
  begin
    hirb_gem_location = ''
    Bundler.with_unbundled_env do
      hirb_gem_location = %x(dirname `gem which hirb`)
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
        Hirb.enable(
          {
            width: (ENV.fetch('RAILS_PRINT_X_COLUMNS', 6).to_i * 35),
            height: 500,
            output:
              ActiveRecord::Base.descendants.reject do |klass_name|
                klass_name.to_s == 'ActiveRecord::SchemaMigration'
              end.
              each_with_object({}) do |klass_name, tmp_hash|
                tmp_hash[klass_name.to_s] = \
                  {
                    options: {
                      fields: klass_name.column_names.take(ENV.fetch('RAILS_PRINT_X_COLUMNS', 6).to_i) | %w[created_at updated_at]
                    }
                  } rescue next
              end
          }
        )

        nil
      end

      def pry_active_record_show_me_the_first(number_of_records)
        ApplicationRecord.descendants.each do |klass_name|
          puts "\n#{klass_name}\n"
          Hirb::View.view_or_page_output(klass_name.first(number_of_records))
        end

        nil
      end

      def pry_active_record_show_me_the_last(number_of_records)
        ApplicationRecord.descendants.each do |klass_name|
          puts "\n#{klass_name}\n"
          Hirb::View.view_or_page_output(klass_name.last(number_of_records))
        end

        nil
      end

      Hirb.enable
      hirb_enable_fancy_print
      hirb_enable_fancy_print_options
    end
  rescue StandardError => e
    # oh well
    puts e.message if e.message
    puts e.cause if e.cause
    puts e.backtrace.join("\n") if e.backtrace
  end
  # Worker.order(created_at: :desc).limit(2)
  # Job.order(created_at: :desc).limit(2)
  # Company.order(id: :desc).limit(2)
  # Employer.order(created_at: :desc).limit(2)
  # Customer.order(created_at: :desc).limit(2)
  # Badge.order(ccreated_at: :desc).limit(2)

  # Golf::Event.limit(2)
  # RAILS_USE_HIRB_GEM=true RAILS_PRINT_X_COLUMNS=16 bundle exec rails console
  # Baseball::Event.limit(2)
end

# pp Hirb::View.config

# RAILS_USE_HIRB_GEM=true RAILS_PRINT_X_COLUMNS=12 bundle exec rails console

puts "Ruby #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"
puts "Pry #{Pry::VERSION}"
puts "PryDoc #{PryDoc::VERSION}"

puts 'Loaded pryrc'
