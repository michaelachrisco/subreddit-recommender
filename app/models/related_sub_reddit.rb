class RelatedSubReddit < ActiveRecord::Base
  belongs_to :sub_reddit
  belongs_to :sub_reddit_relation, class_name: 'SubReddit'

  def to_s
    "#{sub_reddit.name} #{sub_reddit_relation.name}" if sub_reddit && sub_reddit_relation
  end

  def self.all_relations(sub_reddit)
    (self.where(:sub_reddit_id => sub_reddit.id).map(&:sub_reddit_relation) +
    self.where(:sub_reddit_relation => sub_reddit.id).map(&:sub_reddit)).uniq
  end
end
