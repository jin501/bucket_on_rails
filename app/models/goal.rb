class Goal < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  extend FriendlyId

  friendly_id :title, use: :slugged

  belongs_to :buket
  belongs_to :user
  has_many :comments

  def posted_time
    time = time_ago_in_words(self.created_at)
    time
  end

end
