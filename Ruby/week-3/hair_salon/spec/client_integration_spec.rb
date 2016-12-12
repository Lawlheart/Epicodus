require('spec_helper')

describe("Client RESTful routes", {:type => :feature}) do
  before(:each) do
    @russel = Client.new({:name => "Russel"}).save
    @murdoc = Client.new({:name => "Murdoc"}).save
  end

  describe("GET all clients") do
    it('returns a list of all of the clients') do
      visit('/clients')
      expect(page).to have_content("Russel")
      expect(page).to have_content("Murdoc")
    end
  end

  describe("POST client") do
    it('creates a new client') do
      visit('/clients')
      fill_in('new-client-name', :with => "Tim")
      click_button("Add Client")
      expect(page).to have_content("Tim")
    end
  end

  describe("GET client") do
    it('returns the details for the given client') do
      visit("/clients/#{@russel.id}")
      expect(page).to have_content("Russel")
    end
  end

  describe("UPDATE client") do
    it('edits the client name') do
      visit("/clients/#{@russel.id}")
      fill_in('new-client-name', :with => "2-D")
      click_button("Update Client")
      expect(page).to have_content("2-D")
    end
  end

  describe("DELETE client") do
    it('deletes the client') do
      visit("/clients/#{@russel.id}")
      click_button("Delete Client")
      expect(page).to have_content("Clients")
      expect(page).not_to have_content("2-D")
    end
  end

end