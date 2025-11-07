# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
require 'rails/all'
Bundler.require(:default, 'development')

require 'active_support/all'

# silence depreciation warnings
ActiveSupport::Deprecation.silenced = true

if ::ActiveRecord
  ## enable_logger idea thanks to https://github.com/travisjeffery/dotfiles/blob/master/.railsrc
  require 'logger'

  def enable_logger!
    ::ActiveRecord::Base.logger = Logger.new($stdout)

    if Rails.respond_to?(:gem_version) && Rails.gem_version >= Gem::Version.new('6.0.0')
      ::ActiveRecord::Base.connection_handler.clear_active_connections!
    else
      ::ActiveRecord::Base.clear_active_connections!
    end

    nil
  end

  def disable_logger!
    ::ActiveRecord::Base.logger = nil
    if Rails.respond_to?(:gem_version) && Rails.gem_version >= Gem::Version.new('6.0.0')
      ::ActiveRecord::Base.connection_handler.clear_active_connections!
    else
      ::ActiveRecord::Base.clear_active_connections!
    end

    nil
  end

  # Hit all models for auto-completion
  def show_tables
    ::ActiveRecord::Base.establish_connection(Rails.application.config_for(:database))

    ::ActiveRecord::Base.connection.tables.each do |t|
      next if ['ar_internal_metadata', 'schema_migrations'].any?(t)

      begin
        puts t.singularize.classify.constantize.pretty_print_inspect
      rescue StandardError => _e
        puts "skipping #{t}"
      end
    end

    nil
  end

  enable_logger!
  # show_tables
end

# env RUBYOPT="-I$HOME/code/personal/andxyz-dotfiles/ -renable_db_debug_logger.rb" bundle exec rails console
#
# cd $HOME/thescore/sports/thescore-pulse/pulse &&
# (bundle check || bundle install) &&
# env RUBYOPT="-I$HOME/code/andxyz-dotfiles/ -renable_db_debug_logger.rb" bundle exec ./bin/console
