require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      :name => "MyString",
      :cost => "9.99",
      :origin => "MyString",
      :image => "MyString"
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input#product_name[name=?]", "product[name]"

      assert_select "input#product_cost[name=?]", "product[cost]"

      assert_select "input#product_origin[name=?]", "product[origin]"

    end
  end
end
