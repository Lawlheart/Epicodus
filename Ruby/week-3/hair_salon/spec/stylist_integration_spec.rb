require('spec_helper')

describe("Stylist RESTful routes", {:type => :feature}) do
  before(:each) do
    @alice = Client.new({:name => "Alice"}).save
    @sarah = Stylist.new({:name => "Sarah"}).save
  end

  describe("GET stylists") do
    it('shows a list of all of the stylists') do
      visit('/stylists')
      expect(page).to have_content("Sarah")
    end
  end

  describe("POST stylist") do
    it('creates a new stylist') do
      visit('/stylists')
      fill_in('new-stylist-name', :with => "Gwen")
      click_button('Add Stylist')
      expect(page).to have_content("Gwen")
    end
  end

  describe("GET one stylist") do
    it('returns the stylist with the given id') do
      visit("/stylists/#{@sarah.id}")
      expect(page).to have_content("Sarah")
    end
  end

  describe("UPDATE stylist") do
    it('updates a stylists name') do
      visit("/stylists/#{@sarah.id}")
      fill_in("new-stylist-name", :with => "Sera")
      click_button("Update Stylist")
      expect(page).to have_content("Sera")
    end
  end

  describe("DELETE stylist") do
    it('DELETES a stylist') do
      visit("/stylists/#{@sarah.id}")
      click_button("Delete Stylist")
      expect(page).to have_content("Stylists")
      expect(page).not_to have_content("Sarah")
    end
  end

  describe("Add new Client to Stylist") do
    it('CREATES a new Client and assigns it to the stylist') do
      visit("/stylists/#{@sarah.id}")
      fill_in('new-client-name', :with => "James")
      click_button("Add New Client")
      expect(page).to have_content("James")
    end
  end
end
