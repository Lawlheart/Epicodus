class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table(:tasks) do |t|
      t.column(:description, :string)
      t.column(:done, :boolean)

      t.timestamps
    end
  end
end
