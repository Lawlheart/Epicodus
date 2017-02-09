require 'rails_helper'

describe 'the link detail page' do
  it 'shows the name of the link' do
    link = Link.create(name: 'github', url: 'http://github.com')
    visit link_path(link)
    expect(page).to have_content('github')
  end

  it 'shows all of the comments associated with that link' do
    link = Link.create(name: 'github', url: 'http://github.com')
    comment = Comment.create(content: 'good stuff!')
    link.comments.push(comment)
    visit link_path(link)
    expect(page).to have_content('good stuff!')
  end
end