class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :amount
      t.integer :calories, :default => 0
      t.decimal :protein, :default => 0
      t.decimal :fat, :default => 0
      t.decimal :carbs, :default => 0
      t.text  :notes
      t.integer :user_id
      t.date :date, :default => Date.now
      t.timestamps
    end
  end
end
