require 'rails_helper'

describe User do
  it 'creates a new user' do
    user = FactoryGirl.create(:user)
    expect(user.nil?).to eq false
  end

  it 'does not save the user password' do
    user = FactoryGirl.create(:user)
    expect(user.password).to eq nil

  end

end