require 'rails_helper'

describe 'The User Authentication Process' do
  it 'prevents anonymous users from creating new teas' do
    visit new_tea_path
    expect(page).to have_content 'You need to log in.'
  end
  it 'prevents regular users from creating teas' do
    load "#{Rails.root}/db/seeds.rb"
    user = User.find_by_email('guest@example.com')
    login_as(user, :scope => :user)
    visit new_tea_path
    expect(page).to have_content 'Access Denied.'
  end
end