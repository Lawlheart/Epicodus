class CreateExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.time :duration
      t.integer :calories, :default => 0
      t.text :notes
      t.integer :user_id
      t.date :date, :default => Date.now
      t.timestamps
    end
  end
end
