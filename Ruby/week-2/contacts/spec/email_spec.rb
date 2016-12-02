require('rspec')
require('email')

describe(Email) do
  before(:all) do
    @email = Email.new({
        :address => "brigette@example.com",
        :type => "Personal"
    })
  end
  describe("#initialize") do
    it("initializes the class with the information provided") do
      expect(@email.address).to eq "brigette@example.com"
      expect(@email.type).to eq "Personal"
    end
  end
end