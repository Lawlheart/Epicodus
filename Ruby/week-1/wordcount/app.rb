require('sinatra')
require('sinatra/reloader')
require('./lib/word_count')
also_reload('lib/**/*.rb')

set :public_folder, 'public'

get('/') do
  erb(:index)
end

get('/analysis') do
  @phrase = params.fetch('phrase')
  @word = params.fetch('word')
  @partials = params.has_key?('partials')

  if @partials
    @results = @phrase.word_count_partials @word
  else
    @results = @phrase.word_count @word
  end

  erb(:analysis)
end