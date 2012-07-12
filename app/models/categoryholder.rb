class Categoryholder < ActiveRecord::Base
  belongs_to :category
  belongs_to :item_template
  def self.makeSet(item_id, categories)
    if item_id == nil or item_id < 0
      return true
    end
    cats = categories.split(",")
    cats.each do |name|
      name = name.strip
      cat = Category.create(:name => name)
      Categoryholder.create(:item_template_id => item_template, :category_id => cat)
  end
 end
end
