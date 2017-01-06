require('rspec')
require('word')

describe(Word) do
  before(:all) do
    @cat = Word.new({
      :name => "Cat"
    })
    @term = Term.new({
       :definition => "a small domesticated carnivore, Felis domestica or F. catus, bred in a number of varieties.",
       :type => "Noun"
    })
  end
  describe("#initialize") do
    it('creates a word object with the correct name property, exposed with attr_reader') do
      expect(@cat.name).to eq("Cat")
      expect(@cat.definition_list).to eq []
    end
  end
  describe("#add_definition") do
    it('adds definitions to the definition list') do
      @cat.add_definition(@term)
      expect(@cat.definition_list).to eq [@term]
    end
  end
end