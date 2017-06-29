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

  # Hit all models for auto-completion
  def show_tables
    # ::ActiveRecord::Base.establish_connection(Rails.application.config_for(:database))
    ::ActiveRecord::Base.connection.tables.each {|t| t.singularize.classify.constantize rescue nil }
  end

  # logging into console by default
  enable_logger
end

=begin
env RUBYOPT="-I$HOME/code/andxyz-dotfiles/ -renable_db_debug_logger.rb" bundle exec rails console

cd $HOME/thescore/sports/thescore-pulse/pulse &&
(bundle check || bundle install) &&
env RUBYOPT="-I$HOME/code/andxyz-dotfiles/ -renable_db_debug_logger.rb" bundle exec ./bin/console
=end
