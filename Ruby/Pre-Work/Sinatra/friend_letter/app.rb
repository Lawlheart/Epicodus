require('sinatra')
require('sinatra/reloader')

get('/') do
  @friend = "Jessica"
  erb(:letter)
end

get('/australia') do
  @sender = "Jane"
  @recipient = "Jessica"
  erb(:australia)
end

get('/greeting_form') do
  erb(:form)
end

get('/greeting_card') do
  @sender = params.fetch('sender')
  @recipient = params.fetch('recipient')
  erb(:greeting_card)
end