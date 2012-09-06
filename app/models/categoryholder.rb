class Categoryholder < ActiveRecord::Base
  belongs_to :category
  belongs_to :item_template
  def self.makeSet(item_id, categories)
    if item_id == nil or item_id < 0
      return true
    end
    if categories.nil?
      return true
    end
    cats = categories.split(",")
    cats.each do |name|
      name = name.strip
      possibleCat = Category.where(:name => name).first
      if(possibleCat == nil)
        cat = Category.create(:name => name)
        cat_id = cat.id
      else
        cat_id = possibleCat.id
      end
      Categoryholder.create(:item_template_id => item_id, :category_id => cat_id)
  end
 end
end
