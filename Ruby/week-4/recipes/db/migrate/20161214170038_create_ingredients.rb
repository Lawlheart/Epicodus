class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table(:ingredients) do |t|
      t.column(:name, :string)
      t.column(:amount, :string)
      t.column(:recipe_id, :integer)
    end
  end
end
