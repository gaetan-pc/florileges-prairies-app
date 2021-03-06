require File.expand_path("../boot", __FILE__)
require "csv"
require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module FlorilegesPrairies
  class Application < Rails::Application

    # don't generate RSpec tests for views and helpers
    config.generators do |g|
      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_girl, dir: "spec/factories"

      g.view_specs false
      g.helper_specs false
    end

    config.assets.enabled = true
    config.assets.paths << "#{Rails.root}/app/assets/fonts"
    config.eager_load_paths << "#{Rails.root}/app/workers"
    config.autoload_paths << "#{Rails.root}/app/workers"
    config.eager_load_paths << "#{Rails.root}/app/services"
    config.autoload_paths << "#{Rails.root}/app/services"

    console do
      require "pry"
      config.console = Pry
      unless defined? Pry::ExtendCommandBundle
        Pry::ExtendCommandBundle = Module.new
      end
      require "rails/console/app"
      require "rails/console/helpers"
      TOPLEVEL_BINDING.eval("self").extend ::Rails::ConsoleMethods
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
