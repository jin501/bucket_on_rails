class Hashtag < ActiveRecord::Base

  has_many :bucket_hashtag
  has_many :bukets, through: :bucket_hashtags

end
