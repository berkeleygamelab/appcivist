class CreateTags < ActiveRecord::Migration
  def change
	create_table :tags do |t|
		t.integer "cat_id"
		t.integer "type" #1=question, 2=group, 3=challenge, 4=event
		t.integer "question_id"
		t.integer "group_id"
		t.integer "challenge_id"
		t.integer "event_id"
		t.datetime "created_at"
		t.datetime "updated_at"
    end
  end
  
end
