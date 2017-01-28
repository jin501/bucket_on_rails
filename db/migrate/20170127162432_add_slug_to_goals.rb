class AddSlugToGoals < ActiveRecord::Migration[5.0]
  def change
    add_column :goals, :slug, :string
    add_index :goals, :slug, unique: true
  end
end
