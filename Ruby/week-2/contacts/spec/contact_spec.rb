require('rspec')
require('contact')

describe(Contact) do
  describe("#initialize") do
    it('stores basic contact information') do
      contact = Contact.new({
        :first_name => "Brigette",
        :last_name => "Eckert",
        :job => "Front End Developer",
        :company => "Phase2"
      })
      expect(contact.first_name).to eq "Brigette"
      expect(contact.last_name).to eq "Eckert"
      expect(contact.job).to eq "Front End Developer"
      expect(contact.company).to eq "Phase2"
    end
  end
end