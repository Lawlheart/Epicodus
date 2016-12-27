class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table(:answers) do |t|
      t.column(:text, :string)
      t.column(:question_id, :integer)
    end

  end
end
