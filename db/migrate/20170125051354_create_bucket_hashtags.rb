class CreateBucketHashtags < ActiveRecord::Migration[5.0]
  def change
    create_table :bucket_hashtags do |t|
      t.integer :buket_id
      t.integer :hastag_id
    end
  end
end
