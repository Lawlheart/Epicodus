require 'rails_helper'


describe "Food Paths", type: :feature do
  before(:each) do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end

  describe "Create and View food" do
    it "allows the user to create new foods", :js => true do
      visit foods_path
      click_link("Add Food")
      fill_in 'Name', :with => 'Milk'
      click_on 'Create Food'
      expect(page).to have_content 'Milk'
    end
    it "prevents the user from creating foods if no name is provided", :js => true  do
      visit foods_path
      click_link("Add Food")
      click_on 'Create Food'
      expect(page).to have_content 'There was an error.'
    end
  end

  describe "Update Food" do
    it "Allows the user to update food entries", :js => true do
      FactoryGirl.create(:food, :user_id => @user.id)
      visit foods_path
      click_link("Edit")
      fill_in "Name", :with => "Tacos"
      click_on "Update Food"
      expect(page).to have_content "Tacos"
    end
    # it "prevents the user from updating food entries with no name", :js => true  do
    #   FactoryGirl.create(:food, :user_id => @user.id)
    #   visit foods_path
    #   click_link("Edit")
    #   fill_in "Name", :with => ""
    #   click_on "Update Food"
    #   expect(page).to have_content "There was an error."
    # end
  end

  it "Delete Food", :js => true do
    FactoryGirl.create(:food, :user_id => @user.id)
    visit foods_path
    click_link("Delete")
    expect(page).to have_content "Your Food has been successfuly deleted."
  end
end
