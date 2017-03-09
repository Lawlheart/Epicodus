class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :image
      t.string :github
      t.string :demo
      t.integer :user_id
    end
  end
end
