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

ActiveRecord::Schema.define(:version => 20100116150603) do

  create_table "config_files", :force => true do |t|
    t.integer  "pbx_id"
    t.string   "type",       :limit => 25
    t.string   "name",       :limit => 100
    t.text     "config"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "config_files", ["pbx_id", "type", "name"], :name => "index_config_files_on_pbx_id_and_type_and_name"
  add_index "config_files", ["pbx_id", "type"], :name => "index_config_files_on_pbx_id_and_type"
  add_index "config_files", ["pbx_id"], :name => "index_config_files_on_pbx_id"

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["name"], :name => "index_groups_on_name", :unique => true

  create_table "pbxes", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "type"
    t.string   "host"
    t.string   "username"
    t.string   "password"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pbxes", ["name"], :name => "index_pbxes_on_name", :unique => true

  create_table "user_group_maps", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_group_maps", ["group_id"], :name => "index_user_group_maps_on_group_id"
  add_index "user_group_maps", ["user_id", "group_id"], :name => "index_user_group_maps_on_user_id_and_group_id", :unique => true
  add_index "user_group_maps", ["user_id"], :name => "index_user_group_maps_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "login_id",     :limit => 25
    t.string   "md5_password", :limit => 50
    t.string   "name",         :limit => 50
    t.boolean  "active"
    t.datetime "login_at"
    t.string   "login_status", :limit => 25
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["login_id"], :name => "index_users_on_login_id", :unique => true

end
