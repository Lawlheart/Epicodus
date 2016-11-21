require('sinatra')
require('sinatra/reloader')
require('./lib/project')
also_reload('lib/**/*.rb')


get('/') do
  erb(:index)
end