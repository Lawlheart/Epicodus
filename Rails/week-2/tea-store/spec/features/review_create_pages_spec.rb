require 'rails_helper'

describe 'The Tea Creation Process' do
  before(:each) do
    load "#{Rails.root}/db/seeds.rb"
    user = User.find_by_email('admin@example.com')
    login_as(user, :scope => :user)
  end
  it 'allows authenticated users to create reviews' do
    tea = Tea.first
    visit tea_path(tea)
    fill_in 'Title', :with => 'TEST'
    fill_in 'Content', :with => 'TEST'
    fill_in 'Stars', :with => '5'
    click_on 'Create Review'
    expect(page).to have_content 'Review Posted.'
  end
  it 'prevents the user from creating reviews without a title' do
    tea = Tea.first
    visit tea_path(tea)
    fill_in 'Title', :with => ''
    click_on 'Create Review'
    expect(page).to have_content 'Error: invalid Entry'
  end
end