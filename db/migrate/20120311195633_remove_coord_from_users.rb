class RemoveCoordFromUsers < ActiveRecord::Migration
  def up
      #remove_column :users, :lng
      #remove_column :users, :lat
  end

  def down
      add_column :users, :lng
      add_column :users, :lat
  end
end
