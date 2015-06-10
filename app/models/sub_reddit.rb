class SubReddit < ActiveRecord::Base
  has_many :related_sub_reddits, dependent: :destroy
  serialize :bag_of_words

  def to_s
    name
  end
end
