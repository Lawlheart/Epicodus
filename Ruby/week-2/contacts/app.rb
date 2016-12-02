require('sinatra')
require('sinatra/reloader')
require('./lib/contact')
also_reload('lib/**/*.rb')


get('/') do
  erb(:index)
end