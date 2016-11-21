require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the title case path', {:type => :feature}) do
  it('processes the user entry and returns it title cased') do
    visit('/')
    fill_in('title', :with => 'kenny and i both went to university of oregon!')
    click_button('Send')
    expect(page).to have_content('Kenny and I Both Went to University of Oregon!')
  end
end
