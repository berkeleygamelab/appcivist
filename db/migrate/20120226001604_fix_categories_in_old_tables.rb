class FixCategoriesInOldTables < ActiveRecord::Migration
  def up
	remove_column :challenges, :categories_id
	add_column :challenges, :category_id, :integer
	remove_column :events, :categories_id
	add_column :events, :category_id, :integer
	remove_column :questions, :categories_id
	add_column :questions, :category_id, :integer
  end

  def down
  	remove_column :questions, :category_id
	add_column :questions, :categories_id, :integer
	remove_column :events, :category_id
	add_column :events, :categories_id, :integer
	remove_column :challenges, :category_id
	add_column :challengs, :categories_id, :integer
  end
end
