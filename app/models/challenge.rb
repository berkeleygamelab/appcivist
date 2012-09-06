class Challenge < ActiveRecord::Base
  has_many :proposals
  has_many :events
  acts_as :item_template, :as => :producible


  belongs_to :question
  before_save :identify_type
  before_create :be_hacky

  validates :submission_deadline, :presence => true
  validates :vote_deadline, :presence => true

  scope :followed, lambda{|key| {:conditions => {:id => key}}}

  scope :has_category,       lambda{ |n| { :conditions => { :categories_id => n}}}
  scope :has_title, lambda{|name| {:conditions => ["title LIKE ? OR title LIKE ? OR title LIKE ?", "% " + name + " %", name, name + " %"]}}
  scope :keyword, lambda{|key| {:conditions => ["title LIKE ? OR title LIKE ? OR title LIKE ? OR description LIKE ? OR description LIKE ? OR description LIKE ?", "% " + key + " %", key, key + " %", "% " + key + " %", key, key + " %" ]}}

  def identify_type
  type = "Challenge"
  end
  
  def be_hacky
    vote_deadline = voting_deadline
  end
  
  def user
    ItemTemplate.where(:user_id => self.user_id).where(:producible_id => self.id).where(:producible_type => "Challenge").first
  end

    ##copied to item_template

#   def create_followed
#     followed = FollowedChallenge.new
#     followed.user_id = current_user.id
#     followed.challenge_id = id


#     followed.save
#   end
#   def create_followed(follower)
#     followed = FollowedChallenge.new
#     followed.user_id = follower.id
#     followed.challenge_id = id
#     if FollowedChallenge.where(:challenge_id => id).where(:user_id => follower.id) == []
#       followed.save
#     end
#   end
 ##
  def extra_content
    return {"question_id"=>question_id, "submission_deadline"=>submission_deadline,"vote_deadline" => vote_deadline, "minimum_to_run" => minimum_to_run}
  end

   def most_popular(since_last)
     return challenge.where("updated_at > '#{since_last}'").where()
   end

   def remove_followed
      followed = followed_challenges
      a= followed.where(:user_id => current_user.id).first
      return a.destroy
    end

    def remove_followed(follower)
      followed = followed_challenges
      a = followed.where(:user_id => follower.id).first
      return a.destroy
    end

  


end
