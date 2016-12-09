require('sinatra')
require('sinatra/reloader')
require('./lib/city')
require('./lib/train')
also_reload('lib/**/*.rb')
require('pg')

set :public_folder, 'public'

puts DB rescue DB = PG.connect({:dbname => 'express'}) # rescue require('./db_init.rb')

get('/') do
  erb(:index)
end

# CREATE    POST /cities (in progress)
# READ ALL  GET  /cities (done)
# READ ONE  GET /cities/:id
# UPDATE    PATCH /cities/:id
# DELETE    DELETE /cities/:id

get('/cities') do
  @cities = City.all
  erb(:city_list)
end

post('/cities') do
  name = params.fetch('new-city-name')
  City.new({:name => name}).save
  redirect('/cities')
end

get('/cities/:id') do
  #fetch the id, find the city with that id, and then assign @city to that city.
  @city = City.find(params.fetch('id').to_i)
  erb(:city_detail)
end

patch('/cities/:id') do
  @city = City.find(params.fetch('id').to_i)
  @city.update({:name => params.fetch('city-name')})
  redirect "/cities/#{params.fetch('id')}"
end

delete('/cities/:id') do
  @city = City.find(params.fetch('id').to_i)
  @city.delete()
  redirect "/cities"
end

get('/trains') do
  @trains = Train.all
  erb(:train_list)
end

post('/trains') do
  Train.new({:name => params.fetch('new-train-name')}).save
  redirect '/trains'
end

get('/trains/:id') do
  @train = Train.find(params.fetch('id').to_i)
  erb(:train_detail)
end

patch('/trains/:id') do
  @train = Train.find(params.fetch('id').to_i)
  @train.update({:name => params.fetch('train-name')})
  redirect "/trains/#{params.fetch('id')}"
end

delete('/trains/:id') do
  @train = Train.find(params.fetch('id').to_i)
  @train.delete
  redirect '/trains'
end
