class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.column :title, :string
      t.column :description, :string
      t.column :completed, :boolean, :default => false
      t.column :pending, :boolean, :default => false
      t.column :worker_id, :integer
    end
  end
end
