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
  it('allows the user to add addresses to their contacts') do
    find(".add-address-c0").click
    fill_in('local', :with => "1234 Cat Street")
    fill_in('city', :with => "Portland")
    fill_in('state', :with => "Oregon")
    fill_in('zip', :with => "97221")
    fill_in('address-type', :with => "Home")
    click_button('Add Address')
    expect(page).to have_content "Cat Street"
  end
  it('allows the user to add addresses to their contacts') do
    find(".add-phone-c0").click
    fill_in('area-code', :with => "541")
    fill_in('phone-number', :with => "555-1234")
    fill_in('phone-type', :with => "Cell")
    click_button('Add Phone Number')
    expect(page).to have_content "Cell: (541) 555-1234"
  end
end
