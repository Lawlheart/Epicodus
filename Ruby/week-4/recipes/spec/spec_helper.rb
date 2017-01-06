ENV['RACK_ENV'] = 'test'
require('rspec')
require('pg')
require('sinatra/activerecord')
require('ingredient')
require('recipe')
require('tag')

RSpec.configure do |config|
  config.after(:each) do
    Ingredient.all.each(&:destroy)
    Recipe.all.each(&:destroy)
    Tag.all.each(&:destroy)
  end
end
