class CreateTeas < ActiveRecord::Migration[5.0]
  def change
    create_table :teas do |t|
      t.column :name, :string
      t.column :description, :text
      t.column :price, :decimal
      t.column :tea_type, :string
      t.column :caffeine, :integer
      t.column :instructions, :string
      t.column :flavor, :string
    end
  end
end
