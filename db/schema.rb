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

ActiveRecord::Schema.define(:version => 20120830072935) do

  create_table "activities", :force => true do |t|
    t.integer  "group_id"
    t.integer  "project_id"
    t.string   "title"
    t.string   "location"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "betausers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "affiliation"
    t.string   "betacode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string  "name",                              :null => false
    t.integer "cat_popularity", :default => 0
    t.boolean "default_cat",    :default => false
  end

  create_table "categoryholders", :force => true do |t|
    t.integer  "item_template_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "challenges", :force => true do |t|
    t.integer  "question_id"
    t.datetime "vote_deadline"
    t.integer  "minimum_to_run"
    t.datetime "voting_deadline"
    t.datetime "submission_deadline"
  end

  create_table "coordinate", :force => true do |t|
    t.string  "lng"
    t.string  "lat"
    t.integer "area_id"
  end

  create_table "coordinates", :force => true do |t|
    t.string  "location"
    t.integer "order"
    t.integer "tagged_area_id"
  end

  create_table "create_group_areas", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.datetime "time"
    t.integer  "minimum_to_run"
    t.integer  "challenge_id"
  end

  create_table "folders", :force => true do |t|
    t.string  "title",   :null => false
    t.integer "user_id", :null => false
  end

  create_table "followed_challenges", :force => true do |t|
    t.integer  "user_id",      :null => false
    t.integer  "challenge_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "followed_events", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "event_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "followed_questions", :force => true do |t|
    t.integer  "user_id",     :null => false
    t.integer  "question_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "followed_users", :force => true do |t|
    t.integer  "user_id",          :null => false
    t.integer  "followed_user_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_area_lookups", :force => true do |t|
    t.string   "mapid"
    t.integer  "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_areas", :force => true do |t|
    t.integer "tagged area_id", :null => false
    t.integer "group_id",       :null => false
  end

  create_table "groups", :force => true do |t|
    t.string "picture"
    t.string "title"
    t.string "password"
    t.string "description"
  end

  create_table "item_templates", :force => true do |t|
    t.string   "title"
    t.string   "location"
    t.integer  "cat_id"
    t.string   "description",     :limit => 1600
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "update_time",                     :default => '2012-06-11 23:36:50'
    t.integer  "popularity",                      :default => 0
    t.integer  "item_id"
    t.string   "type"
    t.string   "categories"
    t.string   "picture"
    t.integer  "producible_id"
    t.string   "producible_type"
    t.integer  "user_id"
    t.string   "lat"
    t.string   "lng"
  end

  create_table "members", :force => true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", :force => true do |t|
    t.integer "group_id", :null => false
    t.integer "user_id",  :null => false
  end

  create_table "message_copies", :force => true do |t|
    t.integer  "message_id"
    t.integer  "user_id"
    t.integer  "folder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.string   "subject"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", :force => true do |t|
    t.integer "user_id"
    t.integer "type"
    t.integer "item_id"
    t.boolean "seen"
  end

  create_table "projects", :force => true do |t|
    t.integer  "group_id"
    t.string   "title"
    t.string   "description"
    t.string   "purpose"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proposals", :force => true do |t|
    t.string  "subject"
    t.string  "response"
    t.string  "picture"
    t.integer "challenge_id", :null => false
  end

  create_table "questions", :force => true do |t|
    t.boolean "anonymous"
  end

  create_table "received_messages", :force => true do |t|
    t.integer "received_by",                        :null => false
    t.boolean "read?",           :default => false
    t.integer "folder_id"
    t.integer "sent_message_id",                    :null => false
  end

  create_table "response_challenges", :force => true do |t|
    t.integer  "challenge_id",                                :null => false
    t.integer  "user_id",                                     :null => false
    t.string   "response",     :limit => 1600,                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "anonymous",                    :default => 0
  end

  create_table "response_events", :force => true do |t|
    t.integer  "event_id",                                  :null => false
    t.integer  "user_id",                                   :null => false
    t.string   "response",   :limit => 1600,                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "anonymous",                  :default => 0
  end

  create_table "response_questions", :force => true do |t|
    t.integer  "question_id",                                :null => false
    t.integer  "user_id",                                    :null => false
    t.string   "response",    :limit => 1600,                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "anonymous",                   :default => 0
  end

  create_table "response_templates", :force => true do |t|
    t.string   "response"
    t.integer  "depth"
    t.integer  "score"
    t.integer  "parent_id"
    t.integer  "user_id"
    t.boolean  "anonymous"
    t.boolean  "group_response"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_id"
  end

  create_table "response_votes", :force => true do |t|
    t.integer  "response_id"
    t.string   "type_like"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "value"
  end

  create_table "sent_messages", :force => true do |t|
    t.string   "subject"
    t.string   "body"
    t.integer  "sent_by"
    t.datetime "created_at"
    t.boolean  "group_message?"
    t.boolean  "anonymous"
    t.boolean  "group_message"
  end

  create_table "subscriptions", :force => true do |t|
    t.integer "user_id",          :null => false
    t.integer "item_template_id", :null => false
  end

  create_table "tagged_areas", :force => true do |t|
    t.string   "title",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.integer  "cat_id"
    t.integer  "type"
    t.integer  "question_id"
    t.integer  "group_id"
    t.integer  "challenge_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_add_areas", :force => true do |t|
    t.integer  "uid"
    t.datetime "when"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_areas", :force => true do |t|
    t.integer "user_id",        :null => false
    t.integer "tagged_area_id", :null => false
  end

  create_table "user_categories", :force => true do |t|
    t.integer "cat_id",  :null => false
    t.integer "user_id", :null => false
  end

  create_table "user_subscriptions", :force => true do |t|
    t.integer "follower_id", :null => false
    t.integer "followee_id", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login",           :limit => 75,                    :null => false
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",           :limit => 75, :default => " ",   :null => false
    t.string   "password_digest"
    t.string   "location"
    t.string   "password"
    t.string   "type"
    t.string   "temp_pwd"
    t.boolean  "verified",                      :default => false
    t.string   "lat"
    t.string   "lng"
    t.string   "temp_pw"
  end

  create_table "votes", :force => true do |t|
    t.string  "proposal_id", :null => false
    t.integer "user_id",     :null => false
  end

  create_table "voting_records", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "proposal_id"
  end

end
