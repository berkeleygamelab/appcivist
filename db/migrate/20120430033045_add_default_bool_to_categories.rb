class AddDefaultBoolToCategories < ActiveRecord::Migration
  def up
	add_column :categories, :default_cat, :boolean, :default => false
  end
  def down
	drop_column :categories, :default_cat
  end
end
