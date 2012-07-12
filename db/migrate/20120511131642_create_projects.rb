class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :group_id
      t.string :title
      t.string :description
      t.string :purpose
      t.integer :user_id

      t.timestamps
    end
  end
end
