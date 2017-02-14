require 'rails_helper'

RSpec.describe "games/show", type: :view do
  before(:each) do
    @game = assign(:game, Game.create!(
      :title => "Title",
      :image => "Image",
      :summary => "MyText",
      :platforms => "Platforms",
      :rating => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Platforms/)
    expect(rendered).to match(/2/)
  end
end
