class AddParentId < ActiveRecord::Migration
  def up
    add_column :response_templates, :parent_id, :integer
  end

  def down
  end
end
