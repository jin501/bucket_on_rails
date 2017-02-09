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

ActiveRecord::Schema.define(version: 20170209200630) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buket_tags", force: :cascade do |t|
    t.integer "buket_id"
    t.integer "tag_id"
  end

  create_table "bukets", force: :cascade do |t|
    t.string   "title"
    t.string   "caption"
    t.integer  "user_id"
    t.datetime "created_at"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "goal_id"
    t.datetime "created_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "following_id", null: false
    t.integer  "follower_id",  null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["follower_id"], name: "index_follows_on_follower_id", using: :btree
    t.index ["following_id", "follower_id"], name: "index_follows_on_following_id_and_follower_id", unique: true, using: :btree
    t.index ["following_id"], name: "index_follows_on_following_id", using: :btree
  end

  create_table "goals", force: :cascade do |t|
    t.string   "title"
    t.string   "caption"
    t.boolean  "completed"
    t.integer  "buket_id"
    t.integer  "user_id"
    t.string   "picture"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "completed_at"
    t.index ["slug"], name: "index_goals_on_slug", unique: true, using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "full_name"
    t.string   "username"
    t.string   "avatar"
    t.string   "bio"
    t.string   "slug"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  end

end
