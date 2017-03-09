require 'rails_helper'

describe "the adding a comment path" do
  it "adds a comment to a specific choice", js: true do
    choice = FactoryGirl.create(:choice)
    visit root_path
    click_on "Add a comment"
    fill_in "comment_author", with: 'Murphy'
    fill_in "comment_content", with: 'woof woof'
    click_on "Create Comment"
    expect(page).to have_content "woof woof"
  end
end
