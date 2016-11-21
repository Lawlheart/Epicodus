require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the home path', {:type => :feature}) do
  it('it processes the user\'s inputs and replaces the correct characters of the phrase') do
    visit('/')
    fill_in('phrase', :with => "I'm having a lot of fun right now")
    fill_in('target', :with => "now")
    fill_in('substitute', :with => "meow")
    click_button('Swap my words!')
    expect(page).to have_content("I'm having a lot of fun right meow")
  end

end
