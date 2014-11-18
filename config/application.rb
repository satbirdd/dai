require File.expand_path('../boot', __FILE__)

%w(
  active_record
  action_controller
  action_view
  action_mailer
).each do |framework|
  begin
    require "#{framework}/railtie"
  rescue LoadError
  end
end

# require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Dai
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.time_zone = 'Beijing'

    # config.autoload_paths += %W(vendor/neil-models/app/models)
    # config.paths["db/migrate"] << "vendor/neil-models/db/migrate"
     #    app.config.paths["db/migrate"] << %W(vendor/neil-models/db/migrate)
     # end    
    # config.paths["db/migrate"] += %W(vendor/neil-models/db/migrate)
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.i18n.load_path += Dir[Rails.root.join('config','locales', '**', '*.{rb,yml}')]
    config.i18n.default_locale = 'zh-CN'
    config.i18n.enforce_available_locales = true
  end
end
