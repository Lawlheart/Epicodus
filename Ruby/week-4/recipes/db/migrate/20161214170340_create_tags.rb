class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table(:tags) do |t|
      t.column(:name, :string)
  end
    create_table(:recipes_tags) do |t|
      t.column(:tag_id, :integer)
      t.column(:recipe_id, :integer)
    end
  end
end
