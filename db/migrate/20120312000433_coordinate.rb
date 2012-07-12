class Coordinate < ActiveRecord::Migration
  def change 
      create_table :coordinate do |t|
      	t.string :lng
	      t.string :lat
	      t.integer :area_id
      end
  end
end
