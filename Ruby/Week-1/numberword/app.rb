require('sinatra')
require('sinatra/reloader')
require('./lib/numberword')
also_reload('lib/**/*.rb')


get('/') do
  erb(:index)
end

post('/number') do
  @number = params.fetch('number').to_i.numberword
  erb(:number)
end
