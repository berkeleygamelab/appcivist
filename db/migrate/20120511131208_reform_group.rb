class ReformGroup < ActiveRecord::Migration
  def up
    add_column :groups, :title, :string
    add_column :groups, :password, :string
    add_column :groups, :description, :string
  end

  def down
  end
end
