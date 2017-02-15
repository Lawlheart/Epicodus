require 'rails_helper'

describe User, :type => :model do
  it 'allows a user to be created' do
    user = FactoryGirl.create(:user)
    expect(user.nil?).to eq false
  end

  it 'authenticates a user' do
    user = FactoryGirl.create(:user, :password => 'testpassword')
    expect(User.authenticate(user.email, 'testpassword')).to eq user
  end
end
