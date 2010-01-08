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

ActiveRecord::Schema.define(:version => 20100107141138) do

  create_table "group_details", :force => true do |t|
    t.string   "name",        :limit => 25
    t.string   "description", :limit => 100
    t.string   "roles",       :limit => 500
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pbx_details", :force => true do |t|
    t.string   "name",           :limit => 25
    t.string   "description",    :limit => 100
    t.string   "host",           :limit => 50
    t.string   "pbx_type",       :limit => 25
    t.string   "login_name",     :limit => 50
    t.string   "login_password", :limit => 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login_id",     :limit => 25
    t.string   "md5_password", :limit => 50
    t.string   "name",         :limit => 50
    t.integer  "group_id"
    t.datetime "login_at"
    t.string   "login_status", :limit => 25
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
