require 'rails_helper'

describe 'The Tea Update Process' do
  before(:each) do
    load "#{Rails.root}/db/seeds.rb"
    user = User.find_by_email('admin@example.com')
    login_as(user, :scope => :user)
  end
  it 'allows the user to update tea with valid inputs' do
    tea = Tea.all.first
    visit edit_tea_path(tea)
    fill_in 'Name', :with => 'Irish Breakfast'
    click_on 'Update Tea'
    expect(page).to have_content 'Irish Breakfast'
  end

  it 'prevents the user from updating tea without valid inputs' do
    tea = Tea.all.first
    visit edit_tea_path(tea)
    fill_in 'Name', :with => ''
    click_on 'Update Tea'
    expect(page).to have_content 'Something prevented your tea from being updated.'
  end
end