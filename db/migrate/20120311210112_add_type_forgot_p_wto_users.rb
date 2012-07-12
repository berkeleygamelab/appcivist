class AddTypeForgotPWtoUsers < ActiveRecord::Migration
  def up
      add_column :users, :type, :string
      add_column :users, :temp_pw, :integer
  end

  def down
      remove_column :users, :type, :string
      remove_column :sers, :temp_pw, :integer
  end
end
