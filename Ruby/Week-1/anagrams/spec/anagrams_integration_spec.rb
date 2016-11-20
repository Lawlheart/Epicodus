require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the annagram path', {:type => :feature}) do
  it('processes user entry and outputs all words that are anagrams') do
    visit('/')
    fill_in('cypher', :with => "tuba")
    fill_in('word-list', :with => "tuba, scuba, tabu, banana")
    click_button('Anagram?')
    expect(page).to have_content("tuba")
    expect(page).to have_content("tabu")
  end
end
