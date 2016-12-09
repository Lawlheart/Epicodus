require('sinatra')
require('sinatra/reloader')
require('pg')
require('./lib/task')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "to_do"})
