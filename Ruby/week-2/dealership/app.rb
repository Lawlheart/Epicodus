require('sinatra')
require('sinatra/reloader')
require('./lib/dealership')
require('./lib/vehicle')
also_reload('lib/**/*.rb')

get("/") do
  erb(:index)
end

get('/dealerships/new') do
  erb(:dealerships_form)
end

get('/dealerships') do
  @dealerships = Dealership.all()
  erb(:dealerships)
end

post('/dealerships') do
  name = params.fetch('name')
  Dealership.new(name).save()
  redirect "/dealerships"
end

get('/dealerships/:id') do
  @dealership = Dealership.find(params.fetch('id').to_i())
  erb(:dealership)
end

get('/dealerships/:id/vehicles/new') do
  @dealership = Dealership.find(params.fetch('id').to_i)
  erb(:dealership_vehicles_form)
end

post('/vehicles') do
  make = params.fetch('make')
  model = params.fetch('model')
  year = params.fetch('year')
  dealership_id = params.fetch('dealership_id').to_i
  vehicle = Vehicle.new({:make => make, :model => model, :year => year})
  vehicle.save()
  Dealership.find(dealership_id).add_vehicle(vehicle)
  redirect "/dealerships/#{dealership_id}"
end

get('/dealerships/:id/vehicles/:vehicle_id') do
  id = params.fetch("id").to_i
  vid = params.fetch("vehicle_id").to_i
  @dealership = Dealership.find(id)
  @vehicle = Vehicle.find(vid)
  erb(:vehicle)
end
