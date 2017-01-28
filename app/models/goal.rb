class Goal < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :bucket
  belongs_to :user
  has_many :comments



end
