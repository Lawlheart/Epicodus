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
    @home_address = Address.new({
      :local => "1234 Cat Street",
      :city => "Portland",
      :state => "Oregon",
      :zip => 97221,
      :type => "Home"
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
  describe("#address_list") do
    it('displays all of the contacts addresses') do
      expect(@brigette.address_list).to eq []
    end
  end
  describe("#add_address") do
    it('adds a new address to contact info') do
      @brigette.add_address(@home_address)
      expect(@brigette.address_list).to eq [@home_address]
    end
  end
end