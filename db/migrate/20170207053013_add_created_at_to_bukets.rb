class AddCreatedAtToBukets < ActiveRecord::Migration[5.0]
  def change
    add_column(:bukets, :created_at, :datetime)
  end
end
