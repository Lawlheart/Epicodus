require 'rails_helper'

RSpec.describe "games/index", type: :view do
  before(:each) do
    assign(:games, [
      Game.create!(
        :title => "Title",
        :image => "Image",
        :summary => "MyText",
        :platforms => "Platforms",
        :rating => 2
      ),
      Game.create!(
        :title => "Title",
        :image => "Image",
        :summary => "MyText",
        :platforms => "Platforms",
        :rating => 2
      )
    ])
  end

  it "renders a list of games" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Platforms".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
