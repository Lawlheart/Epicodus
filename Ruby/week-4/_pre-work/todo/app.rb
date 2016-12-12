require('sinatra')
require('sinatra/reloader')
require('pg')
require("sinatra/activerecord")
require('./lib/task')
also_reload('lib/**/*.rb')

get('/') do
  @tasks = Task.all
  erb(:index)
end

post('/tasks') do
  @task = Task.new({ :description => params.fetch('description') }).save
  redirect '/'
end

get('/tasks/:id/edit') do
  @task = Task.find(params.fetch('id').to_i)
  erb(:task_edit)
end

patch('/tasks/:id') do
  task = Task.find(params.fetch('id').to_i)
  task.update({:description => params.fetch('description')})
  redirect '/'
end