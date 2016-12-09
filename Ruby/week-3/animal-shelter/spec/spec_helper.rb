require('rspec')
require('person')
require('animal')
require('pg')

DB = PG.connect({:dbname => 'shelter_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM animals *;")
    DB.exec("DELETE FROM people *;")
  end
end
