class AddColumnToResponseTemplates < ActiveRecord::Migration
  def change
    add_column :response_templates, :item_id, :integer
  end
end
