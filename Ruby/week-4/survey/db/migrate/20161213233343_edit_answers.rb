class EditAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column(:answers, :survey_id, :integer)
  end
end
