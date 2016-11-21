require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/title_case')
require('pry')

get('/form') do
  erb(:form)
end

get('/title') do
  @title = params.fetch('title').title_case
  erb(:title)
end