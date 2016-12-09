require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('spec_helper.rb')

describe("Train Integration", {:type => :feature}) do
  before(:each) do
    @l_train = Train.new({:name => "Locomotive"}).save()
  end

  describe("GET Trains") do
    it('shows a list of all of the trains') do
      visit("/trains")
      expect(page).to have_content("Locomotive")
    end
  end

  describe("POST Trains") do
    it('allows a user to create a train') do
      visit('/trains')
      fill_in('new-train-name', :with => 'C')
      click_button('Add Train')
      visit('/trains')
      expect(page).to have_content('C')
    end
  end

  describe("GET individual train") do
    it('allows a user to visit a single page for train') do
      visit("/trains/#{@l_train.id}")
      expect(page).to have_content('Locomotive')
    end
  end

  describe("PATCH train") do
    it('allows a user to update a train') do
      visit("/trains/#{@l_train.id}")
      fill_in('train-name', :with => "Locomotive")
      click_button('Update Train')
      expect(page).to have_content("Locomotive")
    end
  end

  describe('DELETE train') do
    it('allows a user to delete a train') do
      visit("/trains/#{@l_train.id}")
      click_button('Delete Train')
      expect(page).not_to have_content(@l_train.name)
      expect(Train.find(@l_train.id)).to eq(nil)
    end
  end
  describe('#update') do
    it('let you add a city to a train') do
      train = Train.new({:name => "Locomotive"}).save
      portland = City.new({:name => 'Portland'}).save
      seattle = City.new({:name => "Seattle"}).save
      train.update({:city_ids => [portland.id, seattle.id]})
      expect(train.cities).to eq([portland, seattle])
    end
  end
  describe("#actors") do
    it("returns all of the actors in a particular movie") do
      train = Train.new({:name => "Locomotive"}).save
      portland = City.new({:name => 'Portland'}).save
      seattle = City.new({:name => "Seattle"}).save
      train.update({:city_ids => [portland.id, seattle.id]})
      expect(train.cities).to eq([portland, seattle])
    end
  end

end
