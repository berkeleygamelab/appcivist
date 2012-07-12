class AddVal < ActiveRecord::Migration
  def up
    add_column :users, :temp_pwd, :string
  end

  def down
  end
end
