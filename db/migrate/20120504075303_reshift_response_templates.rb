class ReshiftResponseTemplates < ActiveRecord::Migration
  def up
    drop_table :response_templates
    create_table :response_templates do |t|
      t.string :response
      t.integer :depth
      t.integer :score
      t.integer :parent_id
      t.integer :user_id
      t.boolean :anonymous
      t.boolean :group_response
      t.timestamps
      end
  end

  def down
  end
end
