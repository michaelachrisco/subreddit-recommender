class SubReddit < ActiveRecord::Base
  has_many :related_sub_reddits, dependent: :destroy
  belongs_to :sub_reddit_report
  serialize :bag_of_words

  def to_s
    name
  end

  def all_related_subreddit_relations
    (RelatedSubReddit.where(:sub_reddit_relation => self.id) + RelatedSubReddit.where(:sub_reddit => self.id)).sort_by(&:weight)
  end
end
