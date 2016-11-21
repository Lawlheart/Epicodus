require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the home path', {:type => :feature}) do
  it('') do
    visit('/')
    fill_in('rename-me', :with => "rename-me")
    click_button('rename-me')
    expect(page).to have_content("rename-me")
  end
end
