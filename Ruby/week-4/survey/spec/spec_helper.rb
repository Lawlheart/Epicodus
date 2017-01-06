ENV['RACK_ENV'] = 'test'
require('rspec')
require('pg')
require('sinatra/activerecord')
require('survey')
require('question')
require('answer')

RSpec.configure do |config|
  config.after(:each) do
    Survey.all.each(&:destroy)
    Question.all.each(&:destroy)
    Answer.all.each(&:destroy)
  end
end

# Survey.all.each(&:destroy)
