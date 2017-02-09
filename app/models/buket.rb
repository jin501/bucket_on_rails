class Buket < ActiveRecord::Base
  validates_presence_of :title
  belongs_to :user
  has_many :buket_tags
  has_many :tags, through: :buket_tags
  has_many :goals

  def goals_attributes=(attributes)
    attributes.each do |attr|
      if attr[:title] != ""
        @bucket = self.goals.build(attr)
        @bucket.save
      end
    end
  end

end
