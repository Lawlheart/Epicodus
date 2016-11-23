require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the home path', {:type => :feature}) do
  it('it runs a basic analysis') do
    visit('/')
    fill_in('phrase', :with => "hello world")
    fill_in('word', :with => "hello")
    uncheck('partials')
    click_button('Start Analysis')
    expect(page).to have_content("Matches 1")
  end
  it('it runs a partial analysis') do
    visit('/')
    fill_in('phrase', :with => "If Peter Piper picked a peck of pickled peppers, where's the peck of pickled peppers Peter Piper picked?")
    fill_in('word', :with => "pick")
    check('partials')
    click_button('Start Analysis')
    expect(page).to have_content("Matches 4")
  end
end
