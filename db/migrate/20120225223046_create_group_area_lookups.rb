class CreateGroupAreaLookups < ActiveRecord::Migration
  def change
    create_table :group_area_lookups do |t|
      t.string :mapid
      t.integer :uid
      t.timestamps
    end
  end
end
