class AddCreatedAtToGoals < ActiveRecord::Migration[5.0]
  def change
    add_column(:goals, :created_at, :datetime)
    add_column(:goals, :completed_at, :datetime)
  end
end
