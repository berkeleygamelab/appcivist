class FixCategoriez < ActiveRecord::Migration
  def up
	add_column :item_templates, :categories, :string
	add_column :item_templates, :picture, :string
  end

  def down
  end
end
