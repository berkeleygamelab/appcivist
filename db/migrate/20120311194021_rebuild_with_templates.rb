class RebuildWithTemplates < ActiveRecord::Migration
  def up
	create_table "item_templates", :force=>true do |t|
		t.string "title", :limit => 255
		t.string "location"
		t.integer "cat_id"
		t.string "description", :limit => 1600
		t.datetime "created_at"
		t.datetime "updated_at"
		t.datetime "update_time", :default => Time.now
		t.integer "popularity", :default => 0
		t.integer "item_id"
		t.string "type"
	end
	
	create_table "questions", :force => true do |t|
		t.boolean "anonymous?"
	end
		
	create_table "challenges", :force =>true do |t|
		t.integer "question_id"
		t.datetime "submission_deadline"
		t.datetime "vote_deadline"
		t.integer "minimum_to_run"
	end
	
	create_table "events", :force => true do |t|
		t.datetime "time"
		t.integer "challenge_id", :null => false
		t.integer "minimum_to_run" ##redundant with challenge?
	end
	
	create_table "proposals", :force => true do |t|
		t.string "subject"
		t.string "response"
		t.string "picture"
		t.integer "challenge_id", :null => false
	end
	
	create_table "groups", :force => true do |t|
		t.string "picture"
	end
	
	create_table "group_areas", :force => true do |t|
		t.integer "tagged area_id", :null => false
		t.integer "group_id", :null => false
	end
	
	create_table "tagged_areas", :force => true do |t|
		t.string "title", :null => false
		t.datetime "created_at"
		t.datetime "updated_at"
	end
	
	create_table "coordinates", :force =>true do |t|
		t.integer "tagged_area_id", :null => false
		t.string "location"
	end
	
	create_table "response_templates", :force => true do |t|
		t.integer "responder_id", :null => false
		t.string "response"
		t.datetime "created_at"
		t.datetime "updated_at"
		t.boolean "anonymous?"
		t.integer "type", :null => false
		t.integer "item_template_id", :null => false
		t.boolean "group_response?"
	end
	
	create_table "categories", :force => true do |t|
		t.string "name", :null => false
		t.integer "cat_popularity", :default => 0
	end
	
	create_table "users", :force => true do |t|
      t.string     "login",           :limit => 75,                   :null => false
      t.string     "picture",         :limit => 255
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string     "email",           :limit => 75,  :default => " ", :null => false
      t.string   "password_digest"
      t.string   "location"
	  t.string "password"
	end
	
	create_table "user_areas", :force => true do |t|
	  t.integer "user_id", :null => false
	  t.integer "tagged_area_id", :null => false
	end
	
	create_table "user_categories", :force => true do |t|
	  t.integer "cat_id", :null => false
	  t.integer "user_id", :null => false
	end
	
	create_table "folders", :force => true do |t|
	  t.string "title", :null => false
	  t.integer "user_id", :null => false
	end
	
	create_table "votes", :force => true do |t|
	  t.string "proposal_id", :null => false
	  t.integer "user_id", :null => false
	end
	
	create_table "sent_messages", :force => true do |t|
	  t.string "subject"
	  t.string "body"
	  t.integer "sent_by"
	  t.datetime "created_at"
	  t.boolean "group_message?"
	end
	
	create_table "received_messages", :force => true do |t|
	  t.integer "received_by", :null => false
	  t.boolean "read?", :default => false
	  t.integer "folder_id"
	  t.integer "sent_message_id", :null => false
	end
	
	create_table "notifications", :force => true do |t|
	  t.integer "user_id"
	  t.boolean "seen?", :default => false
	  t.integer "type"
	  t.integer "item_id"
	end
	
	create_table "memberships", :force => true do |t|
	  t.integer "group_id", :null => false
	  t.integer "user_id", :null => false
	end
	
	create_table "subscriptions", :force => true do |t|
	  t.integer "user_id", :null => false
	  t.integer "item_template_id", :null => false
	end
	
  end

  def down
  end
end
