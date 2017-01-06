require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require('./lib/place')

get("/") do
  @places = Place.view_passport
  p @places
  erb(:index)
end

post("/stamp") do
  location = params.fetch('place')
  new_place = Place.new(location)
  new_place.stamp_passport
  erb(:success)
end

get("/burn") do
  Place.get_new_passport
  erb(:burn)
end
