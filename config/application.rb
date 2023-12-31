require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FaeScribe
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.generators do |g|
      g.test_framework :rspec,
        controller_specs: false,
        fixtures: false,
        helper_specs: false,
        request_specs: false,
        routing_specs: false,
        view_specs: false
    end

    # Map authorization error to showing public/403.html (forbidden) page
    config.action_dispatch.rescue_responses["ActionPolicy::Unauthorized"] = :forbidden
  end
end
