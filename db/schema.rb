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

ActiveRecord::Schema.define(:version => 20130629153742) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
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

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "badges", :force => true do |t|
    t.string   "name"
    t.string   "file_name"
    t.string   "accomplishment"
    t.text     "description"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "badges_users", :force => true do |t|
    t.integer "user_id"
    t.integer "badge_id"
  end

  create_table "campaigns", :force => true do |t|
    t.integer  "cause_id"
    t.integer  "need_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "percent_complete"
    t.string   "desired_state"
    t.string   "current_state"
    t.boolean  "active",           :default => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "cause_applications", :force => true do |t|
    t.string "name"
    t.string "org_name"
    t.string "website"
    t.string "email"
    t.string "phone_number"
    t.text   "mission"
    t.text   "how_hear"
  end

  create_table "cause_types", :force => true do |t|
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "name"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "causes", :force => true do |t|
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "name"
    t.text     "description"
    t.text     "mission_statement"
    t.text     "how_hear"
    t.string   "phone_number"
    t.string   "email"
    t.string   "website"
    t.integer  "cause_type_id"
    t.string   "city"
    t.string   "region"
    t.string   "video_link"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.boolean  "is_featured",          :default => false
    t.string   "twitter_handle"
    t.string   "facebook_url"
    t.integer  "city_id"
    t.boolean  "active"
    t.string   "display_name"
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "postal_code"
    t.string   "country"
  end

  create_table "causes_cause_types", :force => true do |t|
    t.integer "cause_id"
    t.integer "cause_type_id"
  end

  create_table "causes_causeneeds", :id => false, :force => true do |t|
    t.integer "cause_id"
    t.integer "cause_need_id"
  end

  create_table "causes_causetypes", :force => true do |t|
    t.integer "cause_id"
    t.integer "cause_type_id"
  end

  create_table "donations", :force => true do |t|
    t.float    "amount"
    t.float    "tip"
    t.string   "tracking"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "donations_need_id"
  end

  create_table "featured_causes", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "games", :force => true do |t|
    t.integer  "level"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "user_id"
    t.boolean  "show_instructions", :default => true
  end

  create_table "locations", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "cause_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "name"
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "city"
    t.string   "region"
    t.string   "postal_code"
    t.string   "country"
  end

  create_table "locations_causes", :id => false, :force => true do |t|
    t.integer "location_id"
    t.integer "cause_id"
  end

  create_table "name", :force => true do |t|
    t.string   "name"
    t.integer  "needable_id"
    t.string   "needable_type"
    t.integer  "cause_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "needs", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "cause_id"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "address"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "campaign_id"
  end

  create_table "permissions", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subscribes", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
  end

  create_table "usercauses", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "cause_id"
    t.integer  "user_id"
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text     "bio"
    t.string   "city"
    t.string   "state"
    t.integer  "level",                  :default => 0
    t.string   "provider"
    t.string   "uid"
    t.integer  "game_id"
    t.string   "role"
    t.text     "fb_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_badges", :force => true do |t|
    t.integer "user_id"
    t.integer "badge_id"
  end

  create_table "volunteers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.integer  "volunteer_need_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "email"
  end

end
