# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090210235114) do

  create_table "actions", :force => true do |t|
    t.integer  "user_receved"
    t.integer  "user_attack"
    t.integer  "spell_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bot_actions", :force => true do |t|
    t.integer  "user_request"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "histories", :force => true do |t|
    t.integer  "user_receved"
    t.integer  "user_attack"
    t.integer  "spell_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", :force => true do |t|
    t.integer "level"
    t.integer "need_xp"
    t.integer "hp_received"
  end

  add_index "levels", ["level"], :name => "index_levels_on_level", :unique => true

  create_table "spells", :force => true do |t|
    t.string  "name",       :limit => 40
    t.integer "spell_type"
    t.integer "damage"
    t.integer "level_id"
    t.integer "max_level"
    t.integer "min_level"
  end

  add_index "spells", ["name"], :name => "index_spells_on_name", :unique => true

  create_table "tweet_buffer_logs", :force => true do |t|
    t.integer  "results"
    t.integer  "max_id"
    t.integer  "since_id"
    t.string   "refresh_url"
    t.integer  "results_per_page"
    t.integer  "page"
    t.string   "completed_in"
    t.string   "query"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweet_buffers", :force => true do |t|
    t.integer  "tweet_buffer_log_id"
    t.boolean  "processed",                         :default => false
    t.string   "profile_image_url"
    t.datetime "tweet_created_at"
    t.string   "from_user",           :limit => 50
    t.string   "text"
    t.integer  "to_user_id"
    t.integer  "tweet_id"
    t.string   "to_user",             :limit => 50
    t.integer  "from_user_id"
    t.string   "iso_language_code",   :limit => 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "twitter_users", :force => true do |t|
    t.integer  "twitter_id"
    t.integer  "hp",         :default => 10000
    t.integer  "xp",         :default => 0
    t.integer  "level_id"
    t.string   "guild"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "twitter_users", ["twitter_id"], :name => "index_twitter_users_on_twitter_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
