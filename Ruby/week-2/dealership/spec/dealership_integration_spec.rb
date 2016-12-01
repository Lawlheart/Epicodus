require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the home path', {:type => :feature}) do
  it('shows the welcome message') do
    visit('/')
    expect(page).to have_content("Welcome to Dealership Central!")
  end
end

describe('the /dealerships/new path', {:type => :feature}) do
  it('creates a new dealership') do
    visit('/dealerships/new')
    fill_in('name', :with => 'Joes')
    click_button('Add Dealership')
    expect(page).to have_content "Joes"
  end
end

describe('the /dealerships path', {:type => :feature}) do
  it('shows a list of all of the dealerships') do
    visit('/dealerships')
    expect(page).to have_content "Joes"
  end
end
