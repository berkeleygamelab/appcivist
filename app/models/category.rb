class Category < ActiveRecord::Base
  has_many :categoryholders
  has_many :user_categories
  has_many :item_templates, :through =>:categoryholders
  validates :name, :presence => true
  attr_accessor :cat_id
  validates_uniqueness_of :name
  has_many :users, :through => :user_categories

  def get_n_popular_cats(n,distance,radius)
	items = ItemTemplate.grab_circle(distance, radius)
	catHash = {}
	items.each do |item|
		if catHash[item[cat_id]] == nil
			catHash[item[cat_id]] = 1
			
		else
			catHash[item[cat_id]] = catHash[item[cat_id]]+1
		end
	end
	catArray = []
	n.each do |x|
		catArray +=catHash.max_by{|k,v| v}[0]
		hash[key] = 0
		end
    return Category.find(:all, :conditions => ["cat_id IN (?)", catArray])
  end

  def auto_fill(text)
    cats = Category.where("name LIKE ?", text + '%')
    results = []
    cats.each do |cat|
      results += [cat.name]
      return results
    end
  end

  def return_cat_id(text)
    cat = Category.where(:name => text)
    if cat is nil
      return nil
    end
    return cat.category_id
  end

  def get_default_cats
    return Category.where(:default_cat => true)
  end

  def get_my_categories
    userCats = UserCategory.where(:user_id => self.current_user_id)
    result = []
    userCats.each do |cat|
      result += Category.find_by_id(cat.cat_id)
      end
    return result
  end

end
