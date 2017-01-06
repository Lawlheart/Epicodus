require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the home path', {:type => :feature}) do
  before(:all) do
    visit('/')
    click_button('Add Word')
    fill_in('new-word', :with => "Cat")
    click_button('Create Word')
  end
  it('shows you a list of all words') do
    visit('/')
    expect(page).to have_content "Cat"
  end
  it('lets you create a new word') do
    visit('/')
    click_button('Add Word')
    fill_in('new-word', :with => "Star")
    click_button('Create Word')
    expect(page).to have_content "Cat"
    expect(page).to have_content "Star"
  end
  it('lets the user add a new definition to an existing word') do
    visit('/')
    find(".add-term-c0").click
    fill_in('term-type', :with => "Noun")
    fill_in('term-definition', :with => "a small domesticated carnivore, Felis domestica or F. catus, bred in a number of varieties.")
    click_button('Add New Definition')
    expect(page).to have_content "Cat Noun"
    expect(page).to have_content " domesticated carnivore"
  end
  it('shows the right word when routed by id') do
    visit('/word/0')
    expect(page).to have_content "Cat"
    expect(page).to have_content "a small domesticated carnivore"
  end
  it('redirects to home if I try to GET request a POST route') do
    visit('/word/new')
    expect(page).to have_content("Dictionary")
  end
end

