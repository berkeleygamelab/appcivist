class ChangeStuff < ActiveRecord::Migration
  def up
    change_table :item_templates do |t|
      t.integer :producible_id
      t.string  :producible_type
    end
  end

  def down
  end
end
