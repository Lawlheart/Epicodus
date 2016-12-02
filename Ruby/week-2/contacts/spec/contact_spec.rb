require('rspec')
require('contact')

describe(Contact) do
  before(:all) do
    @brigette = Contact.new({
      :first_name => "Brigette",
      :last_name => "Eckert",
      :job => "Front End Developer",
      :company => "Phase2"
    })
  end
  describe("#initialize") do
    it('stores basic contact information') do

      expect(@brigette.first_name).to eq "Brigette"
      expect(@brigette.last_name).to eq "Eckert"
      expect(@brigette.job).to eq "Front End Developer"
      expect(@brigette.company).to eq "Phase2"
    end
  end
end