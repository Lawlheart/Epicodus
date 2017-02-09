class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.column :content, :string
      t.column :link_id, :integer
      t.column :username, :string

      t.timestamps
    end
  end
end
