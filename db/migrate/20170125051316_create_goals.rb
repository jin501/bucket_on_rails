class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.string :title
      t.string :caption
      t.boolean :completed
      t.integer :buket_id
      t.integer :user_id
      t.string :picture
    end
  end
end
