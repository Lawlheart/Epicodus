require("sinatra")
require("sinatra/reloader")
require('sinatra/activerecord')
also_reload("lib/**/*.rb")
require("pg")
require('./lib/ingredient')
require('./lib/recipe')
require('./lib/tag')

get '/' do
  @recipes = Recipe.all
  erb(:index)
end

get '/recipes/:id' do
  @recipe = Recipe.find(params.fetch('id').to_i)
  erb(:recipe_detail)
end

post '/recipes' do
  Recipe.create({
    :name => params.fetch('new-recipe-name'),
    :instruction => params.fetch('new-recipe-instruction')
  })
  redirect '/'
end

patch '/recipes/:id' do
  recipe = Recipe.find(params.fetch('id').to_i)
  update_name = params.fetch('update-recipe-name')
  update_instruction = params.fetch('update-recipe-instruction')
  p params.fetch('update-recipe-instruction')
  recipe.update({:name => update_name, :instruction => update_instruction})
  redirect "/recipes/#{recipe.id}"
end

delete '/recipes/:id' do
  to_delete = params.fetch("id").to_i
  Recipe.find(to_delete).destroy
  redirect '/'
end

post '/recipes/:recipe_id/tags' do
  recipe_id = params.fetch('recipe_id').to_i
  recipe = Recipe.find(recipe_id)
  new_tags = params.fetch('new-tags')
  Tag.make_all(new_tags).each do |tag|
    unless recipe.tags.find_by_name(tag.name)
      recipe.tags.push(tag)
    end
  end
  redirect "/recipes/#{recipe_id}"
end

delete '/recipes/:recipe_id/tags/:tag_id' do
  recipe = Recipe.find(params.fetch('recipe_id').to_i)
  tag = Tag.find(params.fetch('tag_id').to_i)
  recipe.tags.destroy(tag)
  if tag.recipes.empty?
    tag.destroy
  end
  redirect "/recipes/#{recipe.id}"
end

post '/ingredients' do
  recipe_id = params.fetch('recipe-id').to_i
  ingredient = Ingredient.create({
    :name => params.fetch('new-ingredient-name'),
    :amount => params.fetch('new-ingredient-amount')
  })
  Recipe.find(recipe_id).ingredients.push(ingredient)
  redirect "/recipes/#{recipe_id}"
end

delete '/ingredients/:id' do
  Ingredient.find(params.fetch('id').to_i).destroy
  redirect "/recipes/#{params.fetch('recipe-id')}"
end

Dir["./resources/*.rb"].each { |file| require file }
