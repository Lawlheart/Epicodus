require 'rails_helper'

RSpec.describe "games/new", type: :view do
  before(:each) do
    assign(:game, Game.new(
      :title => "MyString",
      :image => "MyString",
      :summary => "MyText",
      :platforms => "MyString",
      :rating => 1
    ))
  end

  it "renders new game form" do
    render

    assert_select "form[action=?][method=?]", games_path, "post" do

      assert_select "input#game_title[name=?]", "game[title]"

      assert_select "input#game_image[name=?]", "game[image]"

      assert_select "textarea#game_summary[name=?]", "game[summary]"

      assert_select "input#game_platforms[name=?]", "game[platforms]"

      assert_select "input#game_rating[name=?]", "game[rating]"
    end
  end
end
