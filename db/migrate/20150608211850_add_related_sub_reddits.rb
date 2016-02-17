class AddRelatedSubReddits < ActiveRecord::Migration
  def change
    add_column :related_sub_reddits, :sub_reddit_relation_id, :integer
    # add_reference :related_sub_reddits, :sub_reddit_report, index: true
  end
end
