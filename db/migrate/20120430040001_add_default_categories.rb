class AddDefaultCategories < ActiveRecord::Migration
  def up
	Category.create(:name => "Public Space", :default_cat => true)
	Category.create(:name => "Health & Safety", :default_cat => true)
	Category.create(:name => "Transportation", :default_cat => true)
	Category.create(:name => "Dignity and Rights", :default_cat => true)
	Category.create(:name => "Education", :default_cat => true)
  end

  def down
  end
end
