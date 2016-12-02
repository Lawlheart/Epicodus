require('rspec')
require('phone')

describe(Phone) do
  before(:all) do
    @phone = Phone.new({
        :area_code => "541",
        :number => "5557777",
        :type => "Home"
    })
  end
  describe("#initialize") do
    it("initializes the class with the information provided") do
      expect(@phone.area_code).to eq "541"
      expect(@phone.number).to eq "5557777"
      expect(@phone.type).to eq("Home")
    end
  end
end