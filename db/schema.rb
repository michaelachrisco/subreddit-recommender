# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160105204821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "related_sub_reddits", force: :cascade do |t|
    t.integer  "sub_reddit_id"
    t.float    "weight"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "sub_reddit_relation_id"
  end

  add_index "related_sub_reddits", ["sub_reddit_id"], name: "index_related_sub_reddits_on_sub_reddit_id", using: :btree

  create_table "sub_reddit_reports", force: :cascade do |t|
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_reddits", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "document"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.text     "bag_of_words"
    t.integer  "sub_reddit_report_id"
  end

  add_index "sub_reddits", ["sub_reddit_report_id"], name: "index_sub_reddits_on_sub_reddit_report_id", using: :btree

  add_foreign_key "related_sub_reddits", "sub_reddits"
end
