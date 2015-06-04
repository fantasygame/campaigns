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

ActiveRecord::Schema.define(version: 20150604214548) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaignplays", force: :cascade do |t|
    t.integer  "campaign_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "campaignplays", ["campaign_id"], name: "index_campaignplays_on_campaign_id", using: :btree
  add_index "campaignplays", ["user_id"], name: "index_campaignplays_on_user_id", using: :btree

  create_table "campaigns", force: :cascade do |t|
    t.string   "name",           limit: 255, default: ""
    t.text     "description",                default: ""
    t.integer  "game_master_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "money",                      default: 0
  end

  add_index "campaigns", ["deleted_at"], name: "index_campaigns_on_deleted_at", using: :btree
  add_index "campaigns", ["game_master_id"], name: "index_campaigns_on_game_master_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "features", force: :cascade do |t|
    t.string   "key",                        null: false
    t.boolean  "enabled",    default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "gameplays", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gameplays", ["game_id"], name: "index_gameplays_on_game_id", using: :btree
  add_index "gameplays", ["user_id"], name: "index_gameplays_on_user_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.string   "name",        limit: 255, default: ""
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.datetime "date"
  end

  add_index "games", ["campaign_id"], name: "index_games_on_campaign_id", using: :btree
  add_index "games", ["deleted_at"], name: "index_games_on_deleted_at", using: :btree

  create_table "heros", force: :cascade do |t|
    t.string   "name"
    t.string   "archetype"
    t.string   "race"
    t.string   "alignment"
    t.string   "deity"
    t.text     "titles"
    t.text     "appearance"
    t.text     "background"
    t.text     "mechanics"
    t.integer  "user_id"
    t.integer  "campaign_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image"
    t.boolean  "user_character", default: false
  end

  add_index "heros", ["campaign_id"], name: "index_heros_on_campaign_id", using: :btree
  add_index "heros", ["user_id"], name: "index_heros_on_user_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.boolean  "sold",          default: false
    t.integer  "campaign_id"
    t.integer  "hero_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "sold_price",    default: 0
    t.text     "description"
    t.integer  "last_owner_id"
  end

  add_index "items", ["campaign_id"], name: "index_items_on_campaign_id", using: :btree
  add_index "items", ["hero_id"], name: "index_items_on_hero_id", using: :btree

  create_table "money_histories", force: :cascade do |t|
    t.integer  "money_before"
    t.integer  "campaign_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "difference"
  end

  add_index "money_histories", ["campaign_id"], name: "index_money_histories_on_campaign_id", using: :btree
  add_index "money_histories", ["user_id"], name: "index_money_histories_on_user_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.integer "hero_id"
    t.integer "game_id"
  end

  add_index "players", ["game_id"], name: "index_players_on_game_id", using: :btree
  add_index "players", ["hero_id"], name: "index_players_on_hero_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.text     "content"
    t.integer  "game_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "posts", ["deleted_at"], name: "index_posts_on_deleted_at", using: :btree
  add_index "posts", ["game_id"], name: "index_posts_on_game_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "purchases", force: :cascade do |t|
    t.integer  "reward_id"
    t.integer  "campaign_id"
    t.integer  "user_id"
    t.string   "name"
    t.integer  "cost"
    t.boolean  "used"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchases", ["campaign_id"], name: "index_purchases_on_campaign_id", using: :btree
  add_index "purchases", ["reward_id"], name: "index_purchases_on_reward_id", using: :btree
  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id", using: :btree

  create_table "rewards", force: :cascade do |t|
    t.string   "name"
    t.integer  "cost"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
  end

  add_index "rewards", ["campaign_id"], name: "index_rewards_on_campaign_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",   null: false
    t.integer  "item_id",     null: false
    t.string   "event",       null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.integer  "money"
    t.date     "update_time"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "post_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["post_id"], name: "index_votes_on_post_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "heros", "campaigns"
  add_foreign_key "heros", "users"
  add_foreign_key "items", "campaigns"
  add_foreign_key "items", "heros"
  add_foreign_key "money_histories", "campaigns"
  add_foreign_key "money_histories", "users"
  add_foreign_key "players", "games"
  add_foreign_key "players", "heros"
end
