ENV['RACK_ENV'] = 'test'
require('rspec')
require('pg')
require('sinatra/activerecord')
require("shoulda-matchers")
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('brand')
require('store')

RSpec.configure do |config|
  config.after(:each) do
    Brand.all.each(&:destroy)
    Store.all.each(&:destroy)
  end
end
