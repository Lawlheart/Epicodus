class CreateChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :choices do |t|
      # title, description, option_a, option_b, option_a_img, option_b_img
      t.column :title, :string
      t.column :description, :text
      t.column :option_a, :string
      t.column :option_b, :string
    end
  end
end
