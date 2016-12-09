require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('spec_helper.rb')

describe("City RESTful routes", {:type => :feature}) do
  before(:each) do
    @portland = City.new({:name => "Portland, OR"}).save()
  end
  describe("GET Cities") do
    it('shows a list of all of the cities') do
      visit("/cities")
      expect(page).to have_content("Portland, OR")
    end
  end
  describe("POST Cities") do
    it('allows a user to create a city') do
      visit('/cities')
      fill_in('new-city-name', :with => 'Seattle, WA')
      click_button('Add City')
      visit('/cities')
      expect(page).to have_content('Seattle, WA')
    end
  end
  describe("GET individual city") do
    it('allows a user to visit a single page for city') do
      visit("/cities/#{@portland.id}")
      expect(page).to have_content('Portland, OR')
    end
  end
  describe("PATCH city") do
    it('allows a user to update a city') do
      visit("/cities/#{@portland.id}")
      fill_in('city-name', :with => "Portland, OR")
      click_button('Update City')
      expect(page).to have_content("Portland, OR")
    end
  end
  describe('DELETE city') do
    it('allows a user to delete a city') do
      visit("/cities/#{@portland.id}")
      click_button('Delete City')
      expect(page).not_to have_content(@portland.name)
    end
  end
end
