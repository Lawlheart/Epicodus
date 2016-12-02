require('sinatra')
require('sinatra/reloader')
require('./lib/hashy.rb')
also_reload('lib/**/*.rb')
