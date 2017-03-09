require 'rails_helper'

describe 'The Tea Creation Process' do
  before(:each) do
    load "#{Rails.root}/db/seeds.rb"
    user = User.find_by_email('admin@example.com')
    login_as(user, :scope => :user)
  end
  it 'allows a user to create a new tea entry' do
    visit new_tea_path
    fill_in 'Name', :with => 'Irish Breakfast'
    fill_in 'Description', :with => 'Dark, Rich'
    fill_in 'Price', :with => '3.00'
    click_on 'Create Tea'
    expect(page).to have_content 'Irish Breakfast'
  end
  it 'prevents a user from creating a tea without a title' do
    visit new_tea_path
    fill_in 'Name', :with => ''
    click_on 'Create Tea'
    expect(page).to have_content 'Something prevented your tea from being saved.'
  end
end