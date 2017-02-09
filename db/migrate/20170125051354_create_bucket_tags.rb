class CreateBucketTags < ActiveRecord::Migration[5.0]
  def change
    create_table :buket_tags do |t|
      t.integer :buket_id
      t.integer :tag_id
    end
  end
end
