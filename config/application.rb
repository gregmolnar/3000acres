require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Acres
  class Application < Rails::Application

    # don't generate RSpec tests for views and helpers
    config.generators do |g|

      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'

      g.view_specs false
      g.helper_specs false
    end

    #
    # 3000 Acres specific config.  Edit stuff below here if you've forked the app!
    #

    # config.region
    # this region is appended to "address, suburb" when doing geocoding
    config.region = 'Victoria, Australia'

    # config.cloudmade_key
    # used to display cloudmade tiles on maps
    # this key is visible in the HTML anyway so no big risk to put it in git
    config.cloudmade_key = '56299f81f3514c7ca300defbc201af20'

    # config.forbidden_usernames
    # usernames which are forbidden when people are signing up
    config.forbidden_usernames = %w(acres 3000acres 3000_acres admin moderator staff)

  end
end
