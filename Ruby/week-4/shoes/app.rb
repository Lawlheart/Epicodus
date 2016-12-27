require("sinatra")
require("sinatra/reloader")
require('sinatra/activerecord')
also_reload("lib/**/*.rb")
require("pg")
require('./lib/brand')
require('./lib/store')

get '/' do
  @stores = Store.all
  erb(:store_list)
end

get '/stores' do
  redirect '/'
end

get '/stores/:id' do
  @store = Store.find(params.fetch('id').to_i)
  erb(:store_detail)
end

post '/stores' do
  Store.find_or_create_by({:name => params.fetch('new-store-name')})
  redirect '/'
end

patch '/stores/:id' do
  store = Store.find(params.fetch('id').to_i)
  store.update({:name => params.fetch('update-store-name')})
  redirect "/stores/#{store.id}"
end

delete '/stores/:id' do
  Store.find(params.fetch('id').to_i).destroy
  redirect '/'
end

post '/stores/:store_id/brands' do
  store = Store.find(params.fetch('store_id').to_i)
  brand = Brand.find_or_create_by({:name => params.fetch('new-brand-name')})
  store.brands.push(brand)
  redirect "/stores/#{store.id}"
end

get '/brands' do
  @brands = Brand.all
  erb(:brand_list)
end

get '/brands/:id' do
  @brand = Brand.find(params.fetch('id').to_i)
  erb(:brand_detail)
end

post '/brands' do
  Brand.find_or_create_by({:name => params.fetch('new-brand-name')})
  redirect "/brands"
end

post '/brands/:brand_id/stores' do
  brand = Brand.find(params.fetch('brand_id').to_i)
  store = Store.find_or_create_by({:name => params.fetch('new-store-name')})
  brand.stores.push(store)
  redirect "/brands/#{brand.id}"
end

patch '/brands/:id' do
  brand = Brand.find(params.fetch('id').to_i)
  brand.update({:name => params.fetch('update-brand-name')})
  redirect "/brands/#{brand.id}"
end

delete '/brands/:id' do
  Brand.find(params.fetch('id').to_i).destroy
  redirect "/brands"
end