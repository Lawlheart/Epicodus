require 'rails_helper'

describe 'The authentication process' do
  it 'allows the user to login with the correct credentials' do
    user = FactoryGirl.create(:user, :password => 'testpass')
    visit log_in_path
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => 'testpass'
    click_on 'Log in'
    expect(page).to have_content 'You\'ve been logged in.'
  end

  it 'fails to log the user in with an invalid password' do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => ''
    click_on 'Log in'
    expect(page).to have_content 'There was a problem logging you in.'
  end

  it 'allows the user to log out' do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => 'testpass'
    click_on 'Log in'
    visit log_out_path
    expect(page).to have_content 'You\'ve been logged out successfully.'
  end

end
