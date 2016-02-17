class CreateRelatedSubReddits < ActiveRecord::Migration
  def change
    create_table :related_sub_reddits do |t|
      t.references :sub_reddit, index: true, foreign_key: true
      t.float :weight
      # t.references :sub_reddit_relation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
