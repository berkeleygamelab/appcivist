class CreateCategoryholders < ActiveRecord::Migration
  def change
    create_table :categoryholders do |t|
      t.integer "item_template_id"
      t.integer "category_id"
      t.timestamps
    end
  end
end
