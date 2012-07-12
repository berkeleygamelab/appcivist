class RemoveLangLatFromGroupAreas < ActiveRecord::Migration
  def up
      remove_column :create_group_areas, :lat
      remove_column :create_group_areas, :lng
  end

  def down
      add_column :create_group_areas, :lat
      add_column :create_group_areas, :lng
  end
end
