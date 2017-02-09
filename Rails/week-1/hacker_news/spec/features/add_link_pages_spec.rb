require 'rails_helper'

describe 'the add link process' do
  it 'should add a new list' do
    visit new_link_path
    fill_in 'Name', :with => 'github'
    fill_in 'Url', :with => 'http://github.com'
    fill_in 'Username', :with => 'anonymous'
    click_on 'Create Link'
    expect(page).to have_content 'github'
  end

  it 'should give an error when no name is entered' do
    visit new_link_path
    click_on 'Create Link'
    expect(page).to have_content 'Error:'
  end
end