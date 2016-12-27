require('rspec')
require('term')

# Bundler creates a class named "Definition", so I'm using "Term"
describe(Term) do
  before(:each) do
    @term = Term.new({
        :definition => "a small domesticated carnivore, Felis domestica or F. catus, bred in a number of varieties.",
        :type => "Noun"
    })
  end
  describe("#initialize") do
    it('will initialize a new definition properly') do
      expect(@term.definition).to eq("a small domesticated carnivore, Felis domestica or F. catus, bred in a number of varieties.")
      expect(@term.type).to eq("Noun")
    end
  end
end