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

  def generate_content
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

   def remove_followed(follower)
     followed = followed_events
     a = followed.where(:user_id => follower.id).first
     return a.destroy
   end

   def fetch_location
     @events_table = ENV['csb_locations']
     return ::FT.execute "SELECT Location FROM #{@events_table} WHERE ID = #{id} AND Origin = 'events'"
   end

   def update_location(loc)
     @events_table = ENV['csb_locations']
     @quest_dummy = ::FT.execute "SELECT rowid FROM #{@events_table} WHERE ID = #{id} AND Origin = 'events'"
     if @quest_dummy[0] == nil
       return insert_location(loc)
     end
     @rowid = @quest_dummy[0][:rowid]

     return ::FT.execute "UPDATE #{@events_table} SET Location='#{loc}' WHERE ROWID = '#{@rowid}' AND Origin = 'events'"
   end

   def insert_location(loc)
     @events_table = ENV['csb_locations']
     return ::FT.execute "INSERT INTO #{@events_table} (Location, ID, Origin, Category) VALUES ('#{loc}', #{id}, 'events', #{categories_id})"
   end


   def grab_nearest(number)
     @events_table = ENV['csb_locations']
     @loc_x = location.split[0].to_f
     @loc_y = location.split[1].to_f
     return ::FT.execute "SELECT * FROM #{@events_table} WHERE Origin = 'events' ORDER BY ST_DISTANCE(Location, LATLNG(#{@loc_x},#{@loc_y})) LIMIT #{number}"
   end

    def retrieve_google(db_return)
       rtn = []
       db_return.each do |x|
         rtn += [x[:id]]
       end
       return Event.followed(rtn)
     end


    def most_popular(since_last, distance, target_location)
       set =  Event.where("updated_at > '#{since_last}'").order("popularity DESC")
       google_set = grab_circle(distance, target_location, 25)
       google_fetch = retrieve_google(google_set)
       return google_fetch.where("updated_at > '#{since_last}'").order("popularity DESC")
     end

      def sift_circle(distance, target_loc, number, set)
         circles = grab_circle(distance, target_loc, number)
         circles = retrieve_google_with_set(set, circles)
         return circles
       end

       def retrieve_google_with_set(set, db_return)
         rtn = []
         db_return.each do |x|
           rtn += [x[:id]]
         end
         return set.followed(rtn)
       end
     	def user
     	  ItemTemplate.where(:user_id => self.user_id).where(:producible_id => self.id)
       end

end
