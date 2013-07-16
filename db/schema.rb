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


ActiveRecord::Schema.define(:version => 20130710191226) do

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

  add_index "badges", ["id"], :name => "index_badges_on_id", :unique => true

  create_table "campaigns", :force => true do |t|
    t.integer  "cause_id"
    t.integer  "need_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "percent_complete"
    t.string   "desired_state"
    t.string   "current_state"
    t.boolean  "active",               :default => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "type_of_need"
    t.string   "goal_summary"
    t.string   "timefame_description"
  end

  add_index "campaigns", ["active"], :name => "index_campaigns_on_active"
  add_index "campaigns", ["cause_id"], :name => "index_campaigns_on_cause_id"
  add_index "campaigns", ["id"], :name => "index_campaigns_on_id", :unique => true
  add_index "campaigns", ["need_id"], :name => "index_campaigns_on_need_id"
  add_index "campaigns", ["type_of_need"], :name => "index_campaigns_on_type_of_need"

  create_table "cash_donations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "need_id"
    t.integer  "cause_id"
    t.integer  "amount"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cash_donations", ["cause_id"], :name => "index_cash_donations_on_cause_id"
  add_index "cash_donations", ["id"], :name => "index_cash_donations_on_id", :unique => true
  add_index "cash_donations", ["need_id"], :name => "index_cash_donations_on_need_id"
  add_index "cash_donations", ["user_id"], :name => "index_cash_donations_on_user_id"

  create_table "cause_applications", :force => true do |t|
    t.string "name"
    t.string "org_name"
    t.string "website"
    t.string "email"
    t.string "phone_number"
    t.text   "mission"
    t.text   "how_hear"
  end

  add_index "cause_applications", ["id"], :name => "index_cause_applications_on_id", :unique => true

  create_table "cause_types", :force => true do |t|
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "name"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "slug"
  end

  add_index "cause_types", ["id"], :name => "index_cause_types_on_id", :unique => true
  add_index "cause_types", ["slug"], :name => "index_cause_types_on_slug"

  create_table "causes", :force => true do |t|
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
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
    t.boolean  "is_featured",           :default => false
    t.string   "twitter_handle"
    t.string   "facebook_url"
    t.boolean  "active"
    t.string   "display_name"
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "postal_code"
    t.string   "country"
    t.integer  "locations_count",       :default => 0
    t.integer  "needs_count",           :default => 0
    t.integer  "donations_count",       :default => 0
    t.integer  "volunteers_count",      :default => 0
    t.integer  "followers_count",       :default => 0
    t.string   "slug"
    t.integer  "cash_donations_count",  :default => 0
    t.integer  "goods_donations_count", :default => 0
    t.string   "city_slug"
    t.string   "short_description"
    t.string   "contact_email"
  end

  add_index "causes", ["cause_type_id"], :name => "index_causes_on_cause_type_id"
  add_index "causes", ["city"], :name => "index_causes_on_city"
  add_index "causes", ["city_slug"], :name => "index_causes_on_city_slug"
  add_index "causes", ["id"], :name => "index_causes_on_id", :unique => true
  add_index "causes", ["name"], :name => "index_causes_on_name"
  add_index "causes", ["postal_code"], :name => "index_causes_on_postal_code"
  add_index "causes", ["slug"], :name => "index_causes_on_slug", :unique => true

  create_table "causes_cause_types", :force => true do |t|
    t.integer "cause_id"
    t.integer "cause_type_id"
  end

  add_index "causes_cause_types", ["cause_id"], :name => "index_causes_cause_types_on_cause_id"
  add_index "causes_cause_types", ["cause_type_id"], :name => "index_causes_cause_types_on_cause_type_id"
  add_index "causes_cause_types", ["id"], :name => "index_causes_cause_types_on_id", :unique => true

  create_table "featured_causes", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "cause_id"
  end

  add_index "featured_causes", ["cause_id"], :name => "index_featured_causes_on_cause_id"
  add_index "featured_causes", ["id"], :name => "index_featured_causes_on_id", :unique => true

  create_table "followers", :force => true do |t|
    t.integer  "cause_id"
    t.integer  "user_id"
    t.integer  "need_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "followers", ["cause_id"], :name => "index_followers_on_cause_id"
  add_index "followers", ["id"], :name => "index_followers_on_id", :unique => true
  add_index "followers", ["need_id"], :name => "index_followers_on_need_id"
  add_index "followers", ["user_id"], :name => "index_followers_on_user_id"

  create_table "goods_donations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "need_id"
    t.integer  "cause_id"
    t.string   "description"
    t.integer  "quantity"
    t.integer  "cash_value"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "goods_donations", ["cause_id"], :name => "index_goods_donations_on_cause_id"
  add_index "goods_donations", ["id"], :name => "index_goods_donations_on_id", :unique => true
  add_index "goods_donations", ["need_id"], :name => "index_goods_donations_on_need_id"
  add_index "goods_donations", ["user_id"], :name => "index_goods_donations_on_user_id"

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

  add_index "locations", ["cause_id"], :name => "index_locations_on_cause_id"
  add_index "locations", ["city"], :name => "index_locations_on_city"
  add_index "locations", ["country"], :name => "index_locations_on_country"
  add_index "locations", ["id"], :name => "index_locations_on_id", :unique => true
  add_index "locations", ["latitude", "longitude"], :name => "index_locations_on_latitude_and_longitude"
  add_index "locations", ["postal_code"], :name => "index_locations_on_postal_code"

  create_table "needs", :force => true do |t|
    t.string   "name"
    t.string   "type_of_need"
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
    t.text     "settings"
    t.integer  "location_id"
  end

  add_index "needs", ["campaign_id"], :name => "index_needs_on_campaign_id"
  add_index "needs", ["cause_id"], :name => "index_needs_on_cause_id"
  add_index "needs", ["id"], :name => "index_needs_on_id", :unique => true
  add_index "needs", ["type_of_need"], :name => "index_needs_on_type_of_need"

  create_table "subscribes", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
  end

  add_index "subscribes", ["email"], :name => "index_subscribes_on_email"
  add_index "subscribes", ["id"], :name => "index_subscribes_on_id", :unique => true

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
    t.text     "fb_token"
    t.string   "role"
    t.string   "slug"
    t.integer  "followers_count",        :default => 0
    t.integer  "cash_donations_count",   :default => 0
    t.integer  "goods_donations_count",  :default => 0
    t.integer  "volunteers_count",       :default => 0
    t.string   "authentication_token"
    t.boolean  "cause_admin"
    t.integer  "cause_admin_id"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["id"], :name => "index_users_on_id", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true

  create_table "users_badges", :force => true do |t|
    t.integer "user_id"
    t.integer "badge_id"
  end

  add_index "users_badges", ["id"], :name => "index_users_badges_on_id", :unique => true
  add_index "users_badges", ["user_id"], :name => "index_users_badges_on_user_id"

  create_table "volunteers", :force => true do |t|
    t.integer  "cause_id"
    t.integer  "user_id"
    t.integer  "need_id"
    t.integer  "location_id"
    t.string   "description"
    t.boolean  "user_showed_up", :default => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "volunteers", ["cause_id"], :name => "index_volunteers_on_cause_id"
  add_index "volunteers", ["id"], :name => "index_volunteers_on_id", :unique => true
  add_index "volunteers", ["location_id"], :name => "index_volunteers_on_location_id"
  add_index "volunteers", ["need_id"], :name => "index_volunteers_on_need_id"
  add_index "volunteers", ["user_id"], :name => "index_volunteers_on_user_id"

end
