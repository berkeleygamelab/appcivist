class Geocode < ActiveRecord::Migration
  def up
    add_column :item_templates, :lat, :string
    add_column :item_templates, :lng, :string
    add_column :users, :lat, :string
    add_column :users, :lng, :string
  end

  def down
  end
end
