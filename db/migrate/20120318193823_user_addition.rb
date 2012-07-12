class UserAddition < ActiveRecord::Migration
  def up
    add_column :users, :verified, :boolean, :default => false
    add_column :coordinates, :order, :integer
  end

  def down
  end
end
