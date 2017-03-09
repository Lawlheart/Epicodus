require 'rails_helper'

describe 'The Tea Delete Process' do
  before(:each) do
    load "#{Rails.root}/db/seeds.rb"
    user = User.find_by_email('admin@example.com')
    login_as(user, :scope => :user)
  end
  it 'allows the user to delete the tea' do
    tea = Tea.all.first
    visit tea_path(tea)
    click_on 'Delete'
    expect(page).to have_content 'Your tea has been successfully deleted.'
  end
end