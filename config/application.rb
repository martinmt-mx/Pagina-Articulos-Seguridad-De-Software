require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MartinWebSite
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    # config.load_defaults 6.1
    # config.recaptcha_site_key = ENV['6LeCxDsmAAAAAO0ktwHQOrMKOCwOQhxOLFdY48Se']
    # config.recaptcha_secret_key = ENV['6LeCxDsmAAAAAF7Krr_LDOnvFcB47A_OAjHnNP9S']

    config.recaptcha_site_key = '6LeCxDsmAAAAAO0ktwHQOrMKOCwOQhxOLFdY48Se'
    config.recaptcha_secret_key = '6LeCxDsmAAAAAF7Krr_LDOnvFcB47A_OAjHnNP9S'

    # config/application.rb
    # recaptcha_config = YAML.load_file(Rails.root.join('config', 'recaptcha.yml'))
    # config.recaptcha_site_key = recaptcha_config[Rails.env]['6LeCxDsmAAAAAO0ktwHQOrMKOCwOQhxOLFdY48Se']
    # config.recaptcha_secret_key = recaptcha_config[Rails.env]['6LeCxDsmAAAAAF7Krr_LDOnvFcB47A_OAjHnNP9S']

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
