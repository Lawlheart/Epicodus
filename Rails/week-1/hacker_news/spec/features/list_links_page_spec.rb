require 'rails_helper'

describe 'the link list page' do
  it 'shows a list of all links' do
    Link.create(:url => 'http://github.com', :name => 'github')
    Link.create(:url => 'http://linkedin.com', :name => 'LinkedIn')
    visit links_path
    expect(page).to have_content 'github'
    expect(page).to have_content 'LinkedIn'

  end
end