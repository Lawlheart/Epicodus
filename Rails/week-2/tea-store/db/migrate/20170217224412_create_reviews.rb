class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.column :title, :string
      t.column :content, :text
      t.column :stars, :integer
      t.column :user_id, :integer
      t.column :tea_id, :integer
    end
  end
end
