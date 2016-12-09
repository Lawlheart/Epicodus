require('sinatra')
require('sinatra/reloader')
require('./lib/animal')
require('./lib/person')
also_reload('lib/**/*.rb')

set :public_folder, 'public'

get('/') do
  erb(:index)
end
