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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130419151202) do

  create_table "dim_matches", :force => true do |t|
    t.string   "match_id"
    t.string   "winner_id"
    t.string   "loser_id"
    t.integer  "winner_score"
    t.integer  "loser_score"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "dim_matches", ["loser_id"], :name => "index_dim_matches_on_loser_id"
  add_index "dim_matches", ["match_id"], :name => "index_dim_matches_on_match_id", :unique => true
  add_index "dim_matches", ["winner_id"], :name => "index_dim_matches_on_winner_id"

  create_table "dim_users", :force => true do |t|
    t.string   "gc_id"
    t.integer  "score"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "dim_users", ["gc_id"], :name => "index_dim_users_on_gc_id"

  create_table "games", :force => true do |t|
    t.string   "app_name"
    t.text     "description_tr"
    t.text     "description_en"
    t.string   "title"
    t.string   "version"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "logo2x_file_name"
    t.string   "logo2x_content_type"
    t.integer  "logo2x_file_size"
    t.datetime "logo2x_updated_at"
    t.string   "logo1x_file_name"
    t.string   "logo1x_content_type"
    t.integer  "logo1x_file_size"
    t.datetime "logo1x_updated_at"
    t.string   "logo4x_file_name"
    t.string   "logo4x_content_type"
    t.integer  "logo4x_file_size"
    t.datetime "logo4x_updated_at"
    t.string   "logo1x_tr_file_name"
    t.string   "logo1x_tr_content_type"
    t.integer  "logo1x_tr_file_size"
    t.datetime "logo1x_tr_updated_at"
    t.string   "logo2x_tr_file_name"
    t.string   "logo2x_tr_content_type"
    t.integer  "logo2x_tr_file_size"
    t.datetime "logo2x_tr_updated_at"
    t.string   "logo4x_tr_file_name"
    t.string   "logo4x_tr_content_type"
    t.integer  "logo4x_tr_file_size"
    t.datetime "logo4x_tr_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
