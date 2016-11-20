require('sinatra')
require('sinatra/reloader')
require('./lib/swap')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/swapit') do
  phrase = params.fetch('phrase')
  target = params.fetch('target')
  substitute = params.fetch('substitute')
  @new_phrase = phrase.swap(target, substitute)
  erb(:swapit)
end
