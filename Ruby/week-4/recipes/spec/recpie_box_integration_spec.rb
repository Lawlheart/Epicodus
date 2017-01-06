require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe "recipe box app", {:type => :feature} do
  describe "the view recipes path" do
    it 'will let the user see a list of recipes' do
      Recipe.create({:name => "Beef Wellington", :instruction => "has many"})
      visit '/'
      expect(page).to have_content "Beef Wellington"
    end
  end

  describe "the add recipes path" do
    it "will let the user add new recipes" do
      visit '/'
      fill_in('new-recipe-name', :with => 'Scrambled Eggs')
      fill_in('new-recipe-instruction', :with => 'few')
      click_button('Create Recipe')
      expect(page).to have_content "Scrambled Eggs"
    end
  end

  describe "the individual recipe view" do
    it "will let the user view the specifics of a specific recipe" do
      test_recipe = Recipe.create({:name => "Baja Skillet", :instruction => "has many"})
      visit "/recipes/#{test_recipe.id}"
      expect(page).to have_content "Baja Skillet"
    end

    it "shows a list of ingredients for the recipe" do
      test_recipe = Recipe.create({:name => "Baja Skillet", :instruction => "has many"})
      test_ingredient = Ingredient.create({:name => "Chicken", :amount => "uh. some."})
      test_recipe.ingredients.push(test_ingredient)
      visit "/recipes/#{test_recipe.id}"
      expect(page).to have_content "uh. some. Chicken"
    end

    it "shows a list of tags for the recipe" do
      recipe = Recipe.create({:name => "Pulled Pork", :instruction => "has many"})
      tag = Tag.create({:name => "Pork"})
      recipe.tags.push(tag)
      visit "/recipes/#{recipe.id}"
      expect(page).to have_content "Pork"
    end
  end

  describe "the update recipes path" do
    it "will let the user update a recipe" do
      test_recipe = Recipe.create({:name => "Country Skillet", :instruction => "has many"})
      visit "/recipes/#{test_recipe.id}"
      fill_in('update-recipe-name', :with => 'Country Hashbrown')
      fill_in('update-recipe-instruction', :with => '7 easy steps')
      click_button('Update!')
      expect(page).to have_content "Country Hashbrown"
    end
  end

  describe "the delete recipes path" do
    it "will let the user delete a recipe from the database" do
      test_recipe = Recipe.create({:name => "Country Skillet", :instruction => "has many"})
      visit "/recipes/#{test_recipe.id}"
      click_button('Delete!')
      expect(page).to have_content 'Infinite'
    end
  end

  describe "the create ingredients path" do
    it "allows the user to add new ingredients to a recipe" do
      test_recipe = Recipe.create({:name => "Baja Skillet", :instruction => "has many"})
      visit "/recipes/#{test_recipe.id}"
      fill_in('new-ingredient-amount', :with => "1lb")
      fill_in('new-ingredient-name', :with => "Chicken")
      click_button('Add!')
      expect(page).to have_content "1lb Chicken"
    end
  end

  describe "the delete ingredients path" do
    it "allows the user to delete ingredients" do
      test_recipe = Recipe.create({:name => "Baja Skillet", :instruction => "has many"})
      test_ingredient = Ingredient.create({:name => "Chicken", :amount => "2lb"})
      test_recipe.ingredients.push(test_ingredient)
      visit "/recipes/#{test_recipe.id}"
      find("#ingredient-delete-#{test_ingredient.id}").click
      expect(page).to have_content "Baja Skillet"
      expect(page).not_to have_content "2lb Chicken"
    end
  end
  describe "the add tags path" do
    it "creates a tag for each comma separated value" do
      test_recipe = Recipe.create({:name => "Pulled Pork", :instruction => "has many"})
      visit "/recipes/#{test_recipe.id}"
      fill_in('new-tags', :with => "pork, meat")
      click_button('Add Tags!')
      expect(page).to have_content("pork")
      expect(page).to have_content("meat")
    end
    it "doesn't push duplicate tags" do
      recipe = Recipe.create({:name => "Steak Pie", :instruction => "Many"})
      tag = Tag.create({:name => "meat"})
      visit "/recipes/#{recipe.id}"
      fill_in('new-tags', :with => "meat")
      click_button('Add Tags!')
      expect(page).to have_content("meat")
      expect(page).not_to have_content("meat meat")
    end
  end

  describe "the removes tags path" do
    it "removes a tag from a recipe" do
      test_recipe = Recipe.create({:name => "Pulled Pork", :instruction => "has many"})
      test_tag = Tag.create({:name => "meat"})
      test_recipe.tags.push(test_tag)
      visit "/recipes/#{test_recipe.id}"
      find("#tag-remove-#{test_tag.id}").click
      expect(page).to have_content("Pulled Pork")
      expect(page).not_to have_content("meat")
    end
    it "deletes the tag if it has no remaining recipes" do
      test_recipe = Recipe.create({:name => "Pulled Pork", :instruction => "has many"})
      test_tag = Tag.create({:name => "meat"})
      test_recipe.tags.push(test_tag)
      visit "/recipes/#{test_recipe.id}"
      find("#tag-remove-#{test_tag.id}").click
      expect(Tag.find_by_name(test_tag.name)).to eq nil
    end
  end
end
