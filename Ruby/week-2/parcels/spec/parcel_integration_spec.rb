require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the home path', {:type => :feature}) do
  it('displays the correct price to ship their package') do
    visit('/')
    fill_in('length', :with => "2")
    fill_in('width', :with => "2")
    fill_in('height', :with => "2")
    fill_in('weight', :with => "1")
    select('Standard', :from => "shipping-speed")
    fill_in('shipping-from', :with => "Portland OR")
    fill_in('shipping-to', :with => "Salem OR")
    click_button('Calculate')
    expect(page).to have_content('Cost: $51')
  end
end
