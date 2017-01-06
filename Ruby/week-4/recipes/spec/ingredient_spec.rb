require('spec_helper')

describe Ingredient do
  describe '#recipe' do
    it 'creates the one to many relationship' do
      steak_pie = Recipe.create({:name => "Steak Pie", :instruction => "Many"})
      beef = Ingredient.create({:name => "Beef", :amount => "2lb", :recipe_id => steak_pie.id})
      expect(beef.recipe).to eq steak_pie
    end
  end
end
