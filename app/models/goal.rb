class Goal < ActiveRecord::Base

  belongs_to :bucket
  belongs_to :user
  has_many :comments



end
