class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.column :author, :string
      t.column :content, :string
      t.column :choice_id, :integer
    end
  end
end
