class Hashtag < ActiveRecord::Base

  has_many :bucket_hashtag
  has_many :buckets, through: :bucket_hashtags

end
