class CreateQuestions < ActiveRecord::Migration[5.0]
  def change

    create_table(:questions) do |t|
      t.column(:text, :string)
    end

    add_column(:surveys, :question_id, :integer)
  end
end
