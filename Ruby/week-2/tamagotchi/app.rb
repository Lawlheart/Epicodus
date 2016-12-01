require('sinatra')
require('sinatra/reloader')
require('./lib/tamagotchi')
also_reload('lib/**/*.rb')

$tamagotchi = nil

get('/') do
  @tamagotchi = $tamagotchi
  erb(:index)
end

# /create to make new pet
# make new pet, then redirect to /


get("/create") do
  puts params
  name = params.fetch("name")
  $tamagotchi = Tamagotchi.new(name)
  redirect "/"
end


get('/tick-tock') do
  if $tamagotchi != nil
    $tamagotchi.time_passes
  end
end

# /play route

# /feed route
# /sleep route
# /tick-tock route
# JS will send get request on timer, will reload /
