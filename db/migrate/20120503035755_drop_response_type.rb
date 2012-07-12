class DropResponseType < ActiveRecord::Migration
  def up
    remove_column :response_templates, :responder_id
    add_column :response_templates, :user_id, :integer
    remove_column :response_templates, :type

  end

  def down
  end
end
