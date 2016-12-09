require('rspec')
require('city')
require('train')
require('pg')

DB = PG.connect({:dbname => 'express_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM cities *;")
    DB.exec("DELETE FROM trains *;")
  end
end
