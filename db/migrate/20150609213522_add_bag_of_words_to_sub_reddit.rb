class AddBagOfWordsToSubReddit < ActiveRecord::Migration
  def change
    add_column :sub_reddits, :bag_of_words, :text
  end
end
