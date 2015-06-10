class CreateSubReddits < ActiveRecord::Migration
  def change
    create_table :sub_reddits do |t|
      t.string :name
      t.string :url
      t.string :document

      t.timestamps null: false
    end
  end
end
