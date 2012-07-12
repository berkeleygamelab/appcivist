class CreateCreateGroupAreas < ActiveRecord::Migration
  def change
    create_table :create_group_areas do |t|

      t.string :name
      t.string :lng
      t.string :lat 
      t.timestamps
    end
  end
end
