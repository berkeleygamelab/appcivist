class Rebuild < ActiveRecord::Migration
  def up
    create_table "categories", :force => true do |t|
      t.string   "category"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "challenges", :force => true do |t|
      t.integer  "question_id"
      t.string     "description",         :limit => 1600
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "title"
      t.datetime "submission_deadline"
      t.datetime "vote_deadline"
      t.integer  "user_id"
      t.string   "location"
      t.integer  "categories_id"
      t.datetime "update_time", :default => Time.now
      t.integer  "popularity",                          :default => 0
    end

    create_table "events", :force => true do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "title"
      t.integer  "user_id"
      t.string   "location"
      t.string   "description"
      t.datetime "time"
      t.integer  "categories_id"
      t.integer  "challenge_id"
      t.datetime "update_time", :default => Time.now
      t.integer  "popularity",    :default => 0
    end

    create_table "folders", :force => true do |t|
      t.integer  "user_id"
      t.integer  "parent_id"
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
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
      t.string     "body"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "proposals", :force => true do |t|
      t.integer  "challenge_id",                                :null => false
      t.string     "title",        :limit => 255,                 :null => false
      t.string     "description",  :limit => 1600,                :null => false
      t.integer  "rating",                       :default => 0, :null => false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "user_id"
    end

    create_table "questions", :force => true do |t|
      t.integer  "user_id"
      t.string   "title"
      t.string   "location",      :limit => 1600
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "anonymous",                     :default => 0
      t.string   "description"
      t.integer  "categories_id"
      t.integer  "popularity",                    :default => 0
      t.datetime "update_time", :default => Time.now
    end

    create_table "response_challenges", :force => true do |t|
      t.integer  "challenge_id",                                :null => false
      t.integer  "user_id",                                     :null => false
      t.string     "response",     :limit => 1600,                :null => false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "anonymous",                    :default => 0
    end

    create_table "response_events", :force => true do |t|
      t.integer  "event_id",                                  :null => false
      t.integer  "user_id",                                   :null => false
      t.string     "response",   :limit => 1600,                :null => false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "anonymous",                  :default => 0
    end

    create_table "response_questions", :force => true do |t|
      t.integer  "question_id",                                :null => false
      t.integer  "user_id",                                    :null => false
      t.string     "response",    :limit => 1600,                :null => false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "anonymous",                   :default => 0
    end

    create_table "users", :force => true do |t|
      t.string     "login",           :limit => 75,                   :null => false
      t.string     "picture",         :limit => 255
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string     "email",           :limit => 75,  :default => " ", :null => false
      t.string   "password_digest"
      t.string   "location"
      t.string "lat"
      t.string "lng"
    end

    create_table "voting_records", :force => true do |t|
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "proposal_id"
    end
    
  end

  def down
  end
end
