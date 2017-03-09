class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.integer :user_id
      t.integer :picture_id
      
      t.timestamps
    end
  end
end
