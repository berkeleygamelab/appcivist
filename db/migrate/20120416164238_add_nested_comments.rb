class AddNestedComments < ActiveRecord::Migration
  def up
	add_column :response_templates, :lft, :integer
	add_column :response_templates, :rgt, :integer
	add_column :response_templates, :depth, :integer
  end

  def down
	drop_column :response_templates, :lft, :integer
	drop_column :response_templates, :rgt, :integer
	drop_column :response_templates, :depth, :integer
  end
end
