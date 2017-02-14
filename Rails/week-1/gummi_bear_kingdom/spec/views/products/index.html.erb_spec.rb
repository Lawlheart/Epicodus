require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :name => "Name",
        :cost => "9.99",
        :origin => "Origin",
        :image => "Image"
      ),
      Product.create!(
        :name => "Name",
        :cost => "9.99",
        :origin => "Origin",
        :image => "Image"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "img", :count => 2
  end
end
