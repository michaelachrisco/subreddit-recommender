class AddSubRedditToSubRedditReport < ActiveRecord::Migration
  def change
    add_reference :sub_reddits, :sub_reddit_report, index: true
  end
end
