class FixForeignKeys < ActiveRecord::Migration[5.0]
  def change
    add_column(:questions, :survey_id, :integer)
    remove_column(:surveys, :question_id)
  end
end
