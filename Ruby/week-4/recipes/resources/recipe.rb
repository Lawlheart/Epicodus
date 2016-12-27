get '/api/recipes' do
  content_type :json
  Recipe.all.to_json(include: [:ingredients, :tags])
end

get '/api/recipes/:id' do
  content_type :json
  Recipe.find(params[:id]).to_json(include: [:ingredients, :tags])
end

post '/api/recipes' do
  recipe = Recipe.new(params)

  if recipe.save
    recipe.to_json(include: [:ingredients, :tags])
  else
    halt 422, recipe.errors.full_messages.to_json
  end
end