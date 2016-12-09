require('sinatra')
require('sinatra/reloader')
require('./lib/parcel.rb')
also_reload('lib/**/*.rb')
require('http')
require('dotenv')
Dotenv.load

# set :public_folder, 'public'

get('/') do
  erb(:index)
end

get('/output') do
  length = params.fetch('length').to_i
  width = params.fetch('width').to_i
  height = params.fetch('height').to_i
  weight = params.fetch('weight').to_i
  @shipping_speed = params.fetch('shipping-speed')
  @shipping_from = params.fetch('shipping-from')
  @shipping_to = params.fetch('shipping-to')

  # origins=#{shipping_from}&destinations=#{shipping_to}&units=imperial&key=#{key}
  key = ENV["GOOGLE_MAPS_API_KEY"]
  url = "https://maps.googleapis.com/maps/api/distancematrix/json"
  p url
  location_data = HTTP.get(url, :params => {
      :origins => @shipping_from,
      :destinations => @shipping_to,
      :units => "imperial",
      :key => key
    })
  distance = location_data.parse.fetch("rows")[0].fetch("elements")[0].fetch("distance").fetch("value")/1000
  @miles = location_data.parse.fetch("rows")[0].fetch("elements")[0].fetch("distance").fetch("text")
  @duration = location_data.parse.fetch("rows")[0].fetch("elements")[0].fetch("duration").fetch("text")

  @parcel = Parcel.new(length, width, height, weight)
  @price = @parcel.cost_to_ship(@shipping_speed, distance)
  erb(:output)
end
