class CreateBuckets < ActiveRecord::Migration[5.0]
  def change
    create_table :buckets do |t|
      t.string :title
      t.string :caption
      t.integer :user_id
    end
  end
end
