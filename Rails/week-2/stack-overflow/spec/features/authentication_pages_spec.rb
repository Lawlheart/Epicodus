require 'rails_helper'

describe 'The authentication process' do
  it 'allows the user to log in' do
    user = FactoryGirl.create(:user, :password => 'testpassword')
    visit login_path
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => 'testpassword'
    click_on 'Login'
    expect(page).to have_content 'You\'ve been logged in.'
  end

  it 'fails to log the user in if they provide the wrong password' do
    user = FactoryGirl.create(:user, :password => 'testpassword')
    visit login_path
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => 'password'
    click_on 'Login'
    expect(page).to have_content 'There was a problem logging you in.'
  end


  it 'successfully logs the user out' do
    user = FactoryGirl.create(:user, :password => 'testpassword')
    visit login_path
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => 'testpassword'
    click_on 'Login'
    visit logout_path
    expect(page).to have_content 'You\'ve been logged out successfully.'
  end
end