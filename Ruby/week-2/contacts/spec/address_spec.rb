require('rspec')
require('address')

describe Address do
  before(:all) do
    @address = Address.new({
      :local => "1234 Cat Street",
      :city => "Portland",
      :state => "Oregon",
      :zip => 97221,
      :type => "Home"
    })
  end
  describe("#initialize") do
    it("initializes the class with the information provided") do
      expect(@address.local).to eq "1234 Cat Street"
      expect(@address.city).to eq "Portland"
      expect(@address.state).to eq "Oregon"
      expect(@address.zip).to eq 97221
    end
  end

end