class Tag < ActiveRecord::Base

  has_many :buket_tags
  has_many :bukets, through: :buket_tags

end
