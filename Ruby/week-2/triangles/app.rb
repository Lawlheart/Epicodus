require('sinatra')
require('sinatra/reloader')
require('./lib/triangle.rb')
also_reload('lib/**/*.rb')

get('/') do

  erb(:index)
end

get('/triangle') do
  side1 = params.fetch('side-1').to_i
  side2 = params.fetch('side-2').to_i
  side3 = params.fetch('side-3').to_i
  @user_triangle = Triangle.new(side1, side2, side3)
  erb(:triangle)
end
