require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Widget2
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource(
         '*',
         headers: :any,
         methods: [:get, :post, :options, :patch, :put, :delete]
        )
      end
    end
  end
end



# config.middleware.use Rack::Cors do
#   allow do
#      origins '*'
#      resource '/embed.js', :headers => :any, :methods => [:get, :post, :options] #-> I believe resource needs to be a specific URL - will have to check this
#   end
# end

# Settings in config/environments/* take precedence over those specified here.
# Application configuration should go into files in config/initializers
# -- all .rb files in that directory are automatically loaded.
