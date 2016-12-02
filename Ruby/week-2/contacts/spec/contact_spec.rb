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
    @brigette_home_address = Address.new({
      :local => "1234 Cat Street",
      :city => "Portland",
      :state => "Oregon",
      :zip => "97221",
      :type => "Home"
    })
    @brigette_home_phone = Phone.new({
      :area_code => "541",
      :number => "5557777",
      :type => "Home"
    })
  end
  describe("#initialize") do
    it('stores basic contact information') do
      expect(@brigette.first_name).to eq "Brigette"
      expect(@brigette.last_name).to eq "Eckert"
      expect(@brigette.job).to eq "Front End Developer"
      expect(@brigette.company).to eq "Phase2"
      expect(@brigette.address_list).to eq []
      expect(@brigette.phone_list).to eq []
      expect(@brigette.email_list).to eq []
    end
  end
  describe("#add_address") do
    it('adds a new address to contact info') do
      @brigette.add_address(@brigette_home_address)
      expect(@brigette.address_list).to eq [@brigette_home_address]
    end
  end
  describe("#add_phone") do
    it('adds a new phone number to contact info') do
      @brigette.add_phone(@brigette_home_phone)
      expect(@brigette.phone_list).to eq [@brigette_home_phone]
    end
  end
end