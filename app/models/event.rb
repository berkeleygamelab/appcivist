class Event < ActiveRecord::Base
  belongs_to :challenge
  acts_as :item_template, :as => :producible

#  belongs_to :question
#  belongs_to :user
#  belongs_to :categories
#  belongs_to :challenge
#  attr_accessor :lat
#  attr_accessor :lng

#  validates :categories_id, :presence => true

#  has_many :response_events
#  has_many :followed_events

  scope :followed, lambda{|key| {:conditions => {:id => key}}}

  scope :has_category,       lambda{ |n| { :conditions => { :categories_id => n}}}
  scope :has_title, lambda{|name| {:conditions => ["title LIKE ? OR title LIKE ? OR title LIKE ?", "% " + name + " %", name, name + " %"]}}
  scope :keyword, lambda{|key| { :conditions => ["title LIKE ? OR title LIKE ? OR title LIKE ? OR description LIKE ? OR description LIKE ? OR description LIKE ?", "% " + key + " %", key, key + " %", "% " + key + " %", key, key + " %" ]}}

  #before_save :upkeep
  

  def category_id
     return categories_id
  end

  def extra_content
  return {"time"=>time, "challenge_id"=>challenge_id, "minimum_to_run"=>minimum_to_run}
  end

  def create_followed
    followed = FollowedEvent.new
    followed.user_id = current_user.id
    followed.event_id = id
    followed.save
  end

  def create_followed(follower)
    followed = FollowedEvent.new
    followed.user_id = follower.id
    followed.event_id = id
    if FollowedEvent.where(:event_id => id).where(:user_id => follower.id) == []
      followed.save
    end
  end

  def most_popular(since_last)
    return Question.where("updated_at > '#{since_last}'").where()
  end

  def remove_followed
     followed = followed_events
     a= followed.where(:user_id => current_user.id).first
     return a.destroy
   end
   
  def user2
    user.where(:producible_type => "Event").first
  end

   def remove_followed(follower)
     followed = followed_events
     a = followed.where(:user_id => follower.id).first
     return a.destroy
   end


end
