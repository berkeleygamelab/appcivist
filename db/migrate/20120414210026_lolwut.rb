class Lolwut < ActiveRecord::Migration
  def up
    add_column :item_templates, :user_id, :integer
  end

  def down
  end
end
