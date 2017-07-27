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

ActiveRecord::Schema.define(version: 20170726174817) do

  create_table "fights", force: :cascade do |t|
    t.integer  "level_id"
    t.integer  "stamina"
    t.string   "boss"
    t.integer  "stages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "fights", ["level_id"], name: "index_fights_on_level_id"

  create_table "levels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "runs", force: :cascade do |t|
    t.integer  "fight_id"
    t.integer  "user_id"
    t.string   "captain_class"
    t.text     "description"
    t.string   "youtube_url"
    t.string   "title"
    t.string   "server"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "level_id"
  end

  add_index "runs", ["created_at", "user_id"], name: "index_runs_on_created_at_and_user_id"
  add_index "runs", ["fight_id"], name: "index_runs_on_fight_id"
  add_index "runs", ["level_id"], name: "index_runs_on_level_id"
  add_index "runs", ["user_id"], name: "index_runs_on_user_id"

  create_table "searches", force: :cascade do |t|
    t.string   "keywords"
    t.string   "captain_class"
    t.integer  "level_id"
    t.integer  "fight_id"
    t.string   "server"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "searches", ["fight_id"], name: "index_searches_on_fight_id"
  add_index "searches", ["level_id"], name: "index_searches_on_level_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
