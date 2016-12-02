require('rspec')
require('address')

describe Address do
  before(:each) do
    address = Address.new({
      :local => "1234 Cat Street",
      :city => "Portland",
      :state => "Oregon",
      :zip => 97221
    })
  end
  describe("#initialize") do
    expect(address.local).to eq "1234 Cat Street"
    expect(address.city).to eq "Portland"
    expect(address.state).to eq "Oregon"
    expect(address.zip).to eq 97221
  end

end