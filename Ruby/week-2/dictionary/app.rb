require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/term')
also_reload('lib/**/*.rb')

$dictionary = []
set :public_folder, 'public'

get('/') do
  @dictionary = $dictionary
  erb(:index)
end

get('/word/:id') do
  @index = params.fetch("id").to_i
  @word = $dictionary[@index]
  erb(:word)
end

post('/word/new') do
  word = Word.new({
    :name => params.fetch('new-word')
  })
  $dictionary.push(word)
  redirect "/"
end

post('/term/new') do
  term = Term.new({
      :definition => params.fetch('term-definition'),
      :type => params.fetch('term-type')
  })
  index = params.fetch('word-index').to_i
  $dictionary[index].add_definition(term)
  if params.has_key?("back-to-word")
    redirect "/word/#{index}"
  else
    redirect "/"
  end
end

get('/**/new') do
  redirect '/'
end