
 class Question < ActiveRecord::Base
  has_many :challenges
  belongs_to :user
  attr_accessor :most_recent, :lat, :lng, :anonymous
  acts_as :item_template, :as => :producible


    scope :has_category,       lambda{ |n| { :conditions => { :categories_id => n}}}
    scope :has_title, lambda{|name| {:conditions => ["title LIKE ? OR title LIKE ? OR title LIKE ?", "% " + name + " %", name, name + " %"]}}

    scope :start_from, lambda{|start| {:conditions => ["id >= ?", start]}}
    scope :keyword_sort, lambda{|key| {:conditions => ["title LIKE ? OR "]}}
    
    scope :followed, lambda{|key| {:conditions => {:id => key}}}
    
    scope :recent_than, lambda{|key| {:conditions => ["updated_at > ?", key]}}
    scope :order_by_followed, {:order => "id IN (SELECT COUNT(*) FROM 'followed_questions' WHERE 'followed_questions'.'question_id' = id)"}
    
    scope :popularity_contest, {:order => "id IN (SELECT COUNT(*) FROM 'followed_questions' WHERE 'followed_questions'.'question_id' = id) + id IN (SELECT COUNT(*) FROM 'response_questions' WHERE 'response_questions'.'question_id' = id)"}
    
    scope :response_contest, {:order => "id IN (SELECT COUNT(*) FROM 'response_questions' WHERE 'response_questions'.'question_id' = id)"}
    
    scope :keyword, lambda{|key| {:conditions => ["title LIKE ? OR title LIKE ? OR title LIKE ? OR description LIKE ? OR description LIKE ? OR description LIKE ?", "% " + key + " %", key, key + " %", "% " + key + " %", key, key + " %" ]}}
    
    @ft = @ft

	def generate_content
		return {"anonymous?"=>anonymous?}
	end
	
	def user
	  ItemTemplate.where(:user_id => self.user_id).where(:producible_id => self.id)
  end
      
end

