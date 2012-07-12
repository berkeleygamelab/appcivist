class CheatAuthLogic < ActiveRecord::Migration
  def up
    remove_column :users, :temp_pw
    add_column :users, :temp_pw, :string
  end

  def down
  end
end
