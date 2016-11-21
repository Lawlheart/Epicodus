require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the home path', {:type => :feature}) do
  it('processes the user entry and returns the score of their word') do
    visit('/')
    fill_in('scrabble-word', :with => 'Capybara')
    click_button("What's my score")
    expect(page).to have_content('17')
  end
end
