class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :cost
      t.string :origin
      t.string :image

      t.timestamps
    end
  end
end
