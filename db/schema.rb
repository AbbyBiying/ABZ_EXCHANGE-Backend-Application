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

ActiveRecord::Schema.define(version: 20150921042813) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.integer  "commentable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "commentable_type"
    t.text     "body"
    t.integer  "user_id"
  end

  create_table "exchanges", force: true do |t|
    t.integer  "listing_id", null: false
    t.integer  "offer_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follow_relationships", force: true do |t|
    t.integer "follower_id"
    t.integer "followed_user_id"
  end

  add_index "follow_relationships", ["followed_user_id"], name: "index_follow_relationships_on_followed_user_id", using: :btree
  add_index "follow_relationships", ["follower_id"], name: "index_follow_relationships_on_follower_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name",        null: false
    t.integer  "user_id",     null: false
    t.integer  "comment_id"
    t.text     "description", null: false
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "images", force: true do |t|
    t.string   "name",        null: false
    t.integer  "user_id",     null: false
    t.string   "url",         null: false
    t.text     "description", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listings", force: true do |t|
    t.string   "name",                null: false
    t.integer  "user_id",             null: false
    t.text     "description",         null: false
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "number",     default: "", null: false
    t.string   "street",     default: "", null: false
    t.string   "city",       default: "", null: false
    t.string   "state",      default: "", null: false
    t.string   "country",    default: "", null: false
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offers", force: true do |t|
    t.string   "name",                null: false
    t.integer  "user_id",             null: false
    t.text     "description",         null: false
    t.integer  "listing_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "successful_exchanges", force: true do |t|
    t.integer  "exchange_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                            null: false
    t.string   "username",                         null: false
    t.string   "password_digest",                  null: false
    t.string   "bio",                 default: "", null: false
    t.integer  "location_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
