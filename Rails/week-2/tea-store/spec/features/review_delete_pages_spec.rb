require 'rails_helper'

describe 'The Tea Creation Process' do
  it 'prevents unauthenticated users from deleting reviews' do
    load "#{Rails.root}/db/seeds.rb"
    user = User.find_by_email('guest@example.com')
    login_as(user, :scope => :user)
    tea = Tea.first
    tea.reviews.new(title: 'Good', content: 'Stuff', stars: 5)
    tea.save
    page.driver.delete("/teas/#{tea.id}/reviews/#{tea.reviews.first.id}")
    visit tea_path(tea)
    expect(page).to have_content 'Admin Access Only.'
  end
  it 'allows authenticated users to delete reviews' do
    load "#{Rails.root}/db/seeds.rb"
    user = User.find_by_email('admin@example.com')
    login_as(user, :scope => :user)
    tea = Tea.first
    tea.reviews.new(title: 'Good', content: 'Stuff', stars: 5)
    tea.save
    visit tea_path(tea)
    click_on 'Delete Review'
    expect(page).to have_content 'Review Deleted Successfully.'
  end
end