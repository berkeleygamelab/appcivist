class CreateUserAddAreas < ActiveRecord::Migration
  def change
    create_table :user_add_areas do |t|
      t.integer   :uid 
      t.datetime  :when
      t.timestamps
    end
  end
end
