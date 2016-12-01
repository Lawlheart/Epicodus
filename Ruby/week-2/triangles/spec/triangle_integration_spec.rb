require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the home path', {:type => :feature}) do
  it('processes the user input and returns the type of triangle') do
    visit('/')
    fill_in('side-1', :with => "5")
    fill_in('side-2', :with => "5")
    fill_in('side-3', :with => "5")
    click_button('Analyze!')
    expect(page).to have_content('equilateral')
  end
end
