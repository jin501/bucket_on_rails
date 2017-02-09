class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :user_id
      t.integer :goal_id
      t.datetime "created_at", null: false
    end
  end
end
