class RelatedSubReddit < ActiveRecord::Base
  belongs_to :sub_reddit
  belongs_to :sub_reddit_relation, class_name: 'SubReddit'

  def to_s
    "#{subreddit.name} #{sub_reddit_relation.name}" if sub_reddit && sub_reddit_relation
  end
end
