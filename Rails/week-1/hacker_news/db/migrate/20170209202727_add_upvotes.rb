class AddUpvotes < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :upvotes, :integer, :default => 0
  end
end
