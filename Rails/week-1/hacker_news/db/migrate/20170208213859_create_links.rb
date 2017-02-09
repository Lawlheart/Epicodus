class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.column :name, :string
      t.column :username, :string
      t.column :url, :string

      t.timestamps
    end
  end
end
