class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.column :selection, :string
      t.column :choice_id, :integer
    end
  end
end
