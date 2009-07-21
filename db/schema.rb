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

ActiveRecord::Schema.define(:version => 20090721035833) do

  create_table "addresses", :force => true do |t|
    t.string   "street"
    t.integer  "number"
    t.string   "district"
    t.integer  "city_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["city_id"], :name => "index_addresses_on_city_id"
  add_index "addresses", ["district"], :name => "index_addresses_on_district"
  add_index "addresses", ["street"], :name => "index_addresses_on_street"
  add_index "addresses", ["user_id"], :name => "fk_addresses_users"

  create_table "assets", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", :force => true do |t|
    t.integer "state_id",               :default => 0,  :null => false
    t.string  "name",     :limit => 50, :default => "", :null => false
  end

  add_index "cities", ["id"], :name => "id", :unique => true

  create_table "crumbs", :force => true do |t|
    t.string   "route"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string "abreviation", :limit => 10, :default => "", :null => false
    t.string "name",        :limit => 20, :default => "", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name",                               :null => false
    t.date     "birthdate",                          :null => false
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.string   "email",                              :null => false
    t.string   "login",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["name"], :name => "index_users_on_name"

end
