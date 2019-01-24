require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Freemarket41aSample
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec
      g.stylesheets false
      g.javascripts false
      g.helper false
    end

    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ja
    config.i18n.available_locales = [:ja, :en]
  end
end
