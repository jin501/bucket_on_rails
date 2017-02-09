class Buket < ActiveRecord::Base

  belongs_to :user
  has_many :bucket_hashtags
  has_many :hashtags, through: :bucket_hashtags
  has_many :goals

  accepts_nested_attributes_for :goals

  def goals_attributes(goals_attributes)
    attributes.values.each do |attr|
      binding.pry
      @bucket = self.goals.build(attr)
      @bucket.save
    end
  end

end
