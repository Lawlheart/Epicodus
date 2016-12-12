require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
also_reload('lib/**/*.rb')
require('pg')

set :public_folder, 'public'

if ENV['DATABASE_URL']
  DB = PG.connect(ENV['DATABASE_URL'])
elsif ENV['RACK_ENV'] != 'test'
  DB = PG.connect({:dbname => "hair_salon"})
end

get('/') do
  @stylists = Stylist.all
  erb(:stylist_list)
end

get('/stylists') do
  @stylists = Stylist.all
  erb(:stylist_list)
end

post('/stylists') do
  Stylist.new({:name => params.fetch("new-stylist-name")}).save
  redirect("/stylists")
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i)
  erb(:stylist_detail)
end

patch('/stylists/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i)
  @stylist.update({:name => params.fetch("new-stylist-name")})
  redirect("/stylists/#{params.fetch("id")}")
end

delete('/stylists/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i)
  @stylist.delete
  redirect("/stylists")
end

post('/stylists/:id/clients/new') do
  @stylist = Stylist.find(params.fetch("id").to_i)
  new_client = Client.new({:name => params.fetch("new-client-name")}).save
  @stylist.add_client(new_client)
  redirect("/stylists/#{params.fetch("id")}")
end

get('/clients') do
  @clients = Client.all
  erb(:client_list)
end

post('/clients') do
  Client.new({:name => params.fetch("new-client-name")}).save
  redirect('/clients')
end

get('/clients/:id') do
  @client = Client.find(params.fetch("id").to_i)
  erb(:client_detail)
end

patch('/clients/:id') do
  @client = Client.find(params.fetch("id").to_i)
  @client.update({:name => params.fetch("new-client-name")})
  redirect("/clients/#{params.fetch("id")}")
end

delete('/clients/:id') do
  @client = Client.find(params.fetch("id").to_i)
  @client.delete
  redirect("/clients")
end