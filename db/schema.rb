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

ActiveRecord::Schema.define(:version => 20100120052931) do

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

  create_table "asterisk_iaxes", :force => true do |t|
    t.integer  "pbx_id",                                            :null => false
    t.string   "name",        :limit => 30,                         :null => false
    t.string   "username",    :limit => 30
    t.string   "type",        :limit => 6,                          :null => false
    t.string   "secret",      :limit => 50
    t.string   "md5secret",   :limit => 32
    t.string   "dbsecret",    :limit => 100
    t.string   "notransfer",  :limit => 10,  :default => "yes"
    t.string   "inkeys",      :limit => 100
    t.string   "outkeys",     :limit => 100
    t.string   "auth",        :limit => 100, :default => "md5",     :null => false
    t.string   "accountcode", :limit => 100
    t.string   "amaflags",    :limit => 100
    t.string   "callerid",    :limit => 100
    t.string   "context",     :limit => 100,                        :null => false
    t.string   "defaultip",   :limit => 15
    t.string   "host",        :limit => 31,  :default => "dynamic", :null => false
    t.string   "language",    :limit => 5
    t.string   "mailbox",     :limit => 50
    t.string   "deny",        :limit => 95
    t.string   "permit",      :limit => 95
    t.string   "qualify",     :limit => 4,   :default => "yes"
    t.string   "disallow",    :limit => 100, :default => "all",     :null => false
    t.string   "allow",       :limit => 100, :default => "ulaw",    :null => false
    t.string   "ipaddr",      :limit => 15
    t.integer  "port",                       :default => 0
    t.integer  "regseconds",                 :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "asterisk_iaxes", ["pbx_id", "username"], :name => "index_asterisk_iaxes_on_pbx_id_and_username", :unique => true

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

  create_table "asterisk_voicemails", :force => true do |t|
    t.integer  "pbx_id",                                           :null => false
    t.string   "customer_id",    :limit => 11,  :default => "0",   :null => false
    t.string   "context",        :limit => 50,  :default => "",    :null => false
    t.string   "mailbox",        :limit => 11,  :default => "0",   :null => false
    t.string   "password",       :limit => 11,  :default => "0",   :null => false
    t.string   "fullname",       :limit => 150, :default => "",    :null => false
    t.string   "email",          :limit => 50,  :default => "",    :null => false
    t.string   "pager",          :limit => 50,  :default => "",    :null => false
    t.string   "tz",             :limit => 10,  :default => "EST", :null => false
    t.string   "attach",         :limit => 4,   :default => "yes", :null => false
    t.string   "saycid",         :limit => 4,   :default => "yes", :null => false
    t.string   "dialout",        :limit => 10,  :default => "",    :null => false
    t.string   "callback",       :limit => 10,  :default => "",    :null => false
    t.string   "review",         :limit => 4,   :default => "no",  :null => false
    t.string   "operator",       :limit => 4,   :default => "no",  :null => false
    t.string   "envelope",       :limit => 4,   :default => "no",  :null => false
    t.string   "sayduration",    :limit => 4,   :default => "no",  :null => false
    t.integer  "saydurationm",                  :default => 1,     :null => false
    t.string   "sendvoicemail",  :limit => 4,   :default => "no",  :null => false
    t.string   "delete",         :limit => 4,   :default => "no",  :null => false
    t.string   "nextaftercmd",   :limit => 4,   :default => "yes", :null => false
    t.string   "forcename",      :limit => 4,   :default => "no",  :null => false
    t.string   "forcegreetings", :limit => 4,   :default => "no",  :null => false
    t.string   "hidefromdir",    :limit => 4,   :default => "yes", :null => false
    t.datetime "stamp",                                            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "asterisk_voicemails", ["pbx_id", "context", "mailbox"], :name => "index_asterisk_voicemails_on_pbx_id_and_context_and_mailbox", :unique => true

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
