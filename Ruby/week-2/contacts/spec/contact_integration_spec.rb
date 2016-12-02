require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the home path', {:type => :feature}) do
  before(:each) do
    visit('/')
    click_button('Add Contact')
    fill_in('first-name', :with => "Sterling")
    fill_in('last-name', :with => "Archer")
    fill_in('job', :with => "Detective")
    fill_in('company', :with => "Figgis Detective Agency")
    click_button('Create Contact')
  end
  it('displays a list of contacts') do
    visit('/')
    expect(page).to have_content "Archer"
  end
end
