class CreateSubRedditReports < ActiveRecord::Migration
  def change
    create_table :sub_reddit_reports do |t|
      t.string :status

      t.timestamps null: false
    end
  end
end
