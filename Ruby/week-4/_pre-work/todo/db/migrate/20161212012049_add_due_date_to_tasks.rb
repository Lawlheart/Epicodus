class AddDueDateToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column(:tasks, :due_date, :datetime)
  end
end
