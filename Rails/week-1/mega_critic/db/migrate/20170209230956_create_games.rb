class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :image
      t.text :summary
      t.string :platforms
      t.integer :rating, :default => 50
      t.date :release_date

      t.timestamps
    end
  end
end
