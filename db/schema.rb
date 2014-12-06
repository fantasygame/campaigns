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

ActiveRecord::Schema.define(version: 20141206205713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaignplays", force: true do |t|
    t.integer  "campaign_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "campaignplays", ["campaign_id"], name: "index_campaignplays_on_campaign_id", using: :btree
  add_index "campaignplays", ["user_id"], name: "index_campaignplays_on_user_id", using: :btree

  create_table "campaigns", force: true do |t|
    t.string   "name",           default: ""
    t.text     "description",    default: ""
    t.integer  "game_master_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "campaigns", ["deleted_at"], name: "index_campaigns_on_deleted_at", using: :btree
  add_index "campaigns", ["game_master_id"], name: "index_campaigns_on_game_master_id", using: :btree

  create_table "gameplays", force: true do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gameplays", ["game_id"], name: "index_gameplays_on_game_id", using: :btree
  add_index "gameplays", ["user_id"], name: "index_gameplays_on_user_id", using: :btree

  create_table "games", force: true do |t|
    t.string   "name",        default: ""
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["campaign_id"], name: "index_games_on_campaign_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
