ENV['RACK_ENV'] = 'test'

require("rspec")
require("pg")
require("sinatra/activerecord")
require("task")
require("list")

RSpec.configure do |config|
  config.after(:each) do
    Task.all.each(&:destroy)
    List.all.each(&:destroy)
  end
end