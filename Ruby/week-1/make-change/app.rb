require('sinatra')
require('sinatra/reloader')
require('./lib/change')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/change') do
  @result = params.fetch('value').to_i.change
  erb(:change)
end
