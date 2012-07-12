class Woops < ActiveRecord::Migration
  def up
    remove_column :coordinates, "tagged_area_id"
    add_column :coordinates, "tagged_area_id", :integer
  end

  def down
  end
end
