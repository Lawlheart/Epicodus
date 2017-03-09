require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FlickrClone
  class Application < Rails::Application
    config.generators.javascript_engine = :js
    config.generators do |g|
      g.orm             :active_record
      g.template_engine :erb
      g.test_framework  :rspec, views: false
      g.stylesheets     true
      g.javascripts     true
    end
  end
end
# example scaffold command:
# rails g scaffold picture title image --no-view-specs --no-helper-specs --no-routing-specs
