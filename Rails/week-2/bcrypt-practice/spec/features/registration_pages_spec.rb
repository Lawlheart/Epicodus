require 'rails_helper'

describe 'the create user process' do
  it 'creates a new user' do
    visit new_user_path
    fill_in 'Email', :with => 'johndoe@example.com'
    fill_in 'Password', :with => 'testpassword'
    fill_in 'Password confirmation', :with => 'testpassword'
    click_on 'Sign Up'
    expect(page).to have_content 'Welcome to the site!'
  end

  it 'fails to create an account if the passwords do not match' do
    visit new_user_path
    fill_in 'Email', :with => 'johndoe@example.com'
    fill_in 'Password', :with => 'testpassword'
    fill_in 'Password confirmation', :with => 'testpasswordzzz'
    click_on 'Sign Up'
    expect(page).to have_content 'There was a problem creating your account. Please try again.'
  end

end