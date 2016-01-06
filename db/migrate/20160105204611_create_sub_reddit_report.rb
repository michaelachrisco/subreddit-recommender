class CreateSubRedditReport < ActiveRecord::Migration
  def change
    create_table :sub_reddit_report do |t|
      t.string :status

      t.timestamps null: false
    end
  end
end
