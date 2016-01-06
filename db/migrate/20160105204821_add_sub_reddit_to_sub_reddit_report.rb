class AddSubRedditToSubRedditReport < ActiveRecord::Migration
  def change
    add_column :sub_reddits, :sub_reddit_id, :integer
    add_index :sub_reddits, :sub_reddit_id
  end
end
