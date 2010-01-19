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

ActiveRecord::Schema.define(:version => 20100119052247) do

  create_table "asterisk_extensions", :force => true do |t|
    t.integer  "pbx_id",                                   :null => false
    t.integer  "commented",                :default => 0,  :null => false
    t.string   "context",    :limit => 80, :default => "", :null => false
    t.string   "exten",      :limit => 40, :default => "", :null => false
    t.text     "config"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "asterisk_extensions", ["pbx_id", "context", "exten"], :name => "index_asterisk_extensions_on_pbx_id_and_context_and_exten"

  create_table "asterisk_sips", :force => true do |t|
    t.integer  "pbx_id",                                                               :null => false
    t.integer  "commented",                     :default => 0
    t.string   "name",           :limit => 80,  :default => ""
    t.string   "host",           :limit => 31,  :default => ""
    t.string   "nat",            :limit => 5,   :default => "no"
    t.string   "type",           :limit => 6,   :default => "friend"
    t.string   "accountcode",    :limit => 20
    t.string   "amaflags",       :limit => 13
    t.string   "callgroup",      :limit => 10
    t.string   "callerid",       :limit => 80
    t.string   "cancallforward", :limit => 3,   :default => "yes"
    t.string   "canreinvite",    :limit => 3,   :default => "yes"
    t.string   "context",        :limit => 80
    t.string   "defaultip",      :limit => 15
    t.string   "dtmfmode",       :limit => 7
    t.string   "fromuser",       :limit => 80
    t.string   "fromdomain",     :limit => 80
    t.string   "insecure",       :limit => 4
    t.string   "language",       :limit => 2
    t.string   "mailbox",        :limit => 50
    t.string   "md5secret",      :limit => 80
    t.string   "deny",           :limit => 95
    t.string   "permit",         :limit => 95
    t.string   "mask",           :limit => 95
    t.string   "musiconhold",    :limit => 100
    t.string   "pickupgroup",    :limit => 10
    t.string   "qualify",        :limit => 3
    t.string   "regexten",       :limit => 80
    t.string   "restrictcid",    :limit => 3
    t.string   "rtptimeout",     :limit => 3
    t.string   "rtpholdtimeout", :limit => 3
    t.string   "secret",         :limit => 80
    t.string   "setvar",         :limit => 100
    t.string   "disallow",       :limit => 100, :default => "all"
    t.string   "allow",          :limit => 100, :default => "g729,ilbc,gsm,ulaw,alaw"
    t.string   "fullcontact",    :limit => 80,  :default => "",                        :null => false
    t.string   "ipaddr",         :limit => 15,  :default => "",                        :null => false
    t.integer  "port",                          :default => 0,                         :null => false
    t.string   "regserver",      :limit => 100
    t.integer  "regseconds",                    :default => 0,                         :null => false
    t.string   "username",       :limit => 80,  :default => "",                        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "asterisk_sips", ["pbx_id", "name"], :name => "index_asterisk_sips_on_pbx_id_and_name"

  create_table "config_files", :force => true do |t|
    t.integer  "pbx_id"
    t.string   "type",       :limit => 25
    t.string   "context",    :limit => 100
    t.text     "config"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "config_files", ["pbx_id", "type", "context"], :name => "index_config_files_on_pbx_id_and_type_and_context"

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
    t.text     "config"
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
