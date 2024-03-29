require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :name => "MyString",
      :cost => "9.99",
      :origin => "MyString",
      :image => "MyString"
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input#product_name[name=?]", "product[name]"

      assert_select "input#product_cost[name=?]", "product[cost]"

      assert_select "input#product_origin[name=?]", "product[origin]"

    end
  end
end
