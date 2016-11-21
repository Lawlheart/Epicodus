require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the change path', {:type => :feature}) do
  it('process the user entry and output change') do
    visit('/')
    fill_in('value', :with => "53")
    click_button('Make Change')
    expect(page).to have_content('Quarters: 2')
    expect(page).to have_content('Pennies: 3')
  end
end
