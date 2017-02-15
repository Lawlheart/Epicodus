require 'rails_helper'

describe 'user creation' do
  it 'allows a new user to be created' do
    visit new_user_path
    fill_in 'Email', :with => 'test@example.com'
    fill_in 'Password', :with => 'test'
    fill_in 'Password confirmation', :with => 'test'
    click_on 'Create User'
    expect(page).to have_content 'Welcome to the site!'
  end

  it 'prevents a user from being created if the password fields do not match' do
    visit new_user_path
    fill_in 'Email', :with => 'test@example.com'
    fill_in 'Password', :with => 'test'
    fill_in 'Password confirmation', :with => 'test2'
    click_on 'Create User'
    expect(page).to have_content 'There was a problem creating your account.'
  end
end