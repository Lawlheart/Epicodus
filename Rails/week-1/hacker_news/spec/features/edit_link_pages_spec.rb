require 'rails_helper'

describe 'the edit link process' do
  it 'edits a link' do
    link = Link.create(:name => 'freecodecamp is neat', :url => 'http://freecodecamp.com')
    visit link_path(link)
    click_on 'Edit'
    fill_in 'Username', :with => 'A User'
    click_on 'Update Link'
    expect(page).to have_content 'A User'
  end
end