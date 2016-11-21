require('sinatra')
require('sinatra/reloader')
require('./lib/anagrams')
also_reload('lib/**/*.rb')


get('/') do
  erb(:index)
end

post('/anagrams') do
  @cypher = params.fetch('cypher')
  word_list = params.fetch('word-list').split(',').map(&:strip)
  @anagrams = @cypher.anagrams(word_list)
  erb(:anagrams)
end
