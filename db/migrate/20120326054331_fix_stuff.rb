class FixStuff < ActiveRecord::Migration
  def up
	#remove_column :sent_messages, "anonymous?"
	#remove_column :response_templates, "anonymous?"
	remove_column :response_templates, "group response?"
	remove_column :sent_messages, "group message?"
	remove_column :received_messages, "read"
	remove_column :questions, "anonymous?"
	remove_column :notifications, "seen?"
	#remove_column :coordinates, "tagged area_id"
	
  end

  def down
  end
end
