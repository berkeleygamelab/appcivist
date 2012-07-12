
class RemoveQmark < ActiveRecord::Migration
  def up
	#remove_column :sent_messages, :anonymous?
	remove_column :response_templates, :anonymous?
	#remove_column :response_templates, "group response"
	#remove_column :sent_messages, "group message?"
	#remove_column :received_messages, :read?
	#remove_column :questions, :anonymous?
	#remove_column :notifications, :seen?
	remove_column :coordinates, :tagged_area_id
	
	add_column :sent_messages, :anonymous, :boolean
	add_column :response_templates, :anonymous, :boolean
	add_column :response_templates, :group_response, :boolean
	add_column :sent_messages, :group_message, :boolean
	add_column :received_messages, :read, :boolean
	add_column :questions, :anonymous, :boolean
	add_column :notifications, :seen, :boolean
	add_column :coordinates, :tagged_area_id, :boolean
  end

  def down
	remove_column :sent_message, :anonymous
	remove_column :response_template, :anonymous
	remove_column :response_template, :group_response
	remove_column :sent_message, :group_message
	remove_column :received_message, :read
	remove_column :question, :anonymous
	remove_column :notification, :seen
	
	add_column :sent_message, :anonymous?
	add_column :response_template, :anonymous?
	add_column :response_template, :group_response?
	add_column :sent_message, :group_message?
	add_column :received_message, :read?
	add_column :question, :anonymous?
	add_column :notification, :seen?
  end
end
