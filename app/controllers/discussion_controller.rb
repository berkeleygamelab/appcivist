class DiscussionController < ApplicationController

def qr
  @url = params[:format]
  @title = params[:title]
  @response = {}
  @response['url'] = @url
  @response['title'] = @title
  return(@response)
end

respond_to :json

def summary
   filterNew
end


def filterNew
    size_limit_questions = 15
   size_limit_discussion = 5
   page_offset = 0
   @collection = []
   @flagsort = false
   @cat_ids = params[:category] # it's an array of integers
   @startDate = params[:timeBefore]
   @endDate = params[:timeAfter]
   @types = params[:types] #array of strings that specifies what type of item we're filtering for; names like question, challenge, event

   @area_to_filter = params[:area_id]

   if @endDate==nil
     @endDate = Time.now
   end
   @events = []

   @questions = []
   @challenges = []
   @location_to_grab = params[:loc]
   @target_user = params[:by_user]
   @radius = params[:radius]
   @following = params[:following]
   @popular = params[:popular]


   @pages = params[:pages]
   #set default pages
   if(@pages == nil)
     @pages = 10
   end

   @default_categories = Category.where(:default_cat => true)
   @my_categories = []
   @popular_categories = []
   @my_areas = []


   if(@location_to_grab == nil)
     if !current_user.nil?
       @location_to_grab = current_user.lat.to_s + " " + current_user.lng.to_s
       @my_categories = current_user.categories
       @my_areas = current_user.tagged_areas
     end
     if current_user.nil?
       @error = "ERROR"
       @items = ItemTemplate.paginate(:page => params[:page]).where(:id => nil)
       return nil
     end
   else
     @location_to_grab = params[:location]
     loc = Geocoder.coordinates(@location_to_grab)
     @location_to_grab = loc[0].to_s + " " + loc[1].to_s
     if !current_user.nil?
       @my_categories -= current_user.categories
     end
   end


   @keyword = params[:keyword]
   if @types == nil
     @types = ["Question","Challenge","Event"]
   end
   @dummy = ItemTemplate.new
   if @radius == nil
     @radius = 25000
   end


   if !@area_to_filter.nil?
     @items = @area_to_filter.grab_items(@types)
   else
     @items = @dummy.grab_circle_type(@radius, @location_to_grab, @types)
   end



   if !@startDate.nil? and !@endDate.nil?
     @between = @startDate..@endDate
     @items = @items.where(:updated_at => @between)
   end

   if !@cat_ids.nil?
     @items = @items.joins(:categoryholders).where("categoryholders.category_id" => @cat_ids).uniq
   end

  @collection = @items
  @items =  @items.paginate(:page => params[:page], :per_page => 5)
  #uts @items
  @item_templates = ItemTemplate.paginate(:page => params[:page], :per_page => 5)

end


def filter
    size_limit_questions = 15
   size_limit_discussion = 5
   page_offset = 0
   @collection = []
   @flagsort = false
   @cat_ids = params[:category] # it's an array of integers
   @startDate = params[:timeBefore]
   @endDate = params[:timeAfter]
   @types = params[:types] #array of strings that specifies what type of item we're filtering for; names like question, challenge, event

   @area_to_filter = params[:area_id]

   if @endDate==nil
     @endDate = Time.now
   end
   @events = []

   @questions = []
   @challenges = []
   @location_to_grab = params[:loc]
   @target_user = params[:by_user]
   @radius = params[:radius]
   @following = params[:following]
   @popular = params[:popular]


   @pages = params[:pages]
   #set default pages
   if(@pages == nil)
     @pages = 10
   end

   @default_categories = Category.where(:default_cat => true)
   @my_categories = []
   @popular_categories = []
   @my_areas = []


   if(@location_to_grab == nil)
     if !current_user.nil?
       @location_to_grab = current_user.lat.to_s + " " + current_user.lng.to_s
       @my_categories = current_user.categories
       @my_areas = current_user.tagged_areas
     end
     if current_user.nil?
       @error = "ERROR"
       @items = ItemTemplate.paginate(:page => params[:page]).where(:id => nil)
       return nil
     end
   else
     if !current_user.nil?
       @location_to_grab = current_user.lat.to_s + " " + current_user.lng.to_s
       @my_categories = current_user.categories
       @my_areas = current_user.tagged_areas
     else
     @location_to_grab = params[:location]
     loc = Geocoder.coordinates(@location_to_grab)
     @location_to_grab = loc[0].to_s + " " + loc[1].to_s
     if !current_user.nil?
       @my_categories -= current_user.categories
     end
   end
   end


   @keyword = params[:keyword]
   if @types == nil
     @types = ["Question","Challenge","Event"]
   end
   @dummy = ItemTemplate.new
   if @radius == nil
     @radius = 25000
   end


   if !@area_to_filter.nil?
     area = TaggedArea.where(:id => @area_to_filter.to_i).first
     @items = area.grab_items(@types)
   else
     @items = @dummy.grab_circle_type(@radius, @location_to_grab, @types)
   end



   if !@startDate.nil? and !@endDate.nil?
     @between = @startDate..@endDate
     @items = @items.where(:updated_at => @between)
   end

   if !@cat_ids.nil?
     @items = @items.joins(:categoryholders).where("categoryholders.category_id" => @cat_ids).uniq
    # FIX THIS THIS IS A QUICK FIX THAT IS LAZY AS HELL
    lazy_set = []
     @items.each do |lazy|
       lazy_set += [lazy.id]
     end
     @items = ItemTemplate.where(:id => lazy_set)
     #END LAZY
   end

  @collection = @items
  @items =  @items.paginate(:page => params[:page], :per_page => 5)
  #uts @items
  @item_templates = ItemTemplate.paginate(:page => params[:page], :per_page => 5)
  puts "we've responded with @items they just havent filtered"
   puts params[:controller]
   if params[:view_type]
      render :partial => 'items_maps', :locals => {:items => @items}
   else
     render :partial=>'items' ,:locals=>  {:items => @items}
   end
   puts "so im assuming the render doesnt do anything"
end

def sort_by_title(set, title)
  return set.has_title(title)
end

def sort_by_category(set, categoryList)

  return set.has_category(categoryList)
end

def sort_by_timestamp(set, num_days)
  timestamp = Time.now - num_days*60*60*24
  return set.where("updated_at > '#{timestamp}'")
end

def follow
  id = params[:item_to_follow]
  type = params[:type]
  add_follower(id, type)
  respond_with(true)
end

def unfollow
  id = params[:item_to_follow]
  type = params[:type]
  remove_follower(id, type)
  respond_with(true)
end

def sort_by_keyword(set, keyword)
  new_set = []
  keys = keyword.split
  keys.each do |wd|
    new_set = new_set | set.keyword(wd)
  end
  new_keys = []
  new_set.each do |thing|
    new_keys += [thing.id]
  end
  return set.followed(new_keys)
end

def add_follower(item_to_follow, type)
  if type == "Question"
    item = Question.where(:id => item_to_follow).first
  end
  if type == "Challenge"
    item = Challenge.where(:id => item_to_follow).first
  end
  if type == "Event"
    item = Event.where(:id => item_to_follow).first
  end
  if type == "User"
      item = User.where(:id => item_to_follow).first
  end
  item.create_followed(current_user)
end

def remove_follower(item_to_follow, type)
    if type == "Question"
      item = Question.where(:id => item_to_follow).first
    end
    if type == "Challenge"
      item = Challenge.where(:id => item_to_follow).first
    end
    if type == "Event"
      item = Event.where(:id => item_to_follow).first
    end
    if type == "User"
        item = User.where(:id => item_to_follow).first
    end
    item.remove_followed(current_user)
end

def sort_descending(set)
  return set.order("id desc")
end

def display_following(set, type)
  followed_set_ids = []

  if type == "Question"
    followed_set = FollowedQuestion.where(:user_id => current_user.id)
  end
  if type == "Challenge"
    followed_set = FollowedChallenge.where(:user_id => current_user.id)
  end
  if type == "Event"
    followed_set = FollowedEvent.where(:user_id => current_user.id)
  end
  followed_set.each do |value|
    followed_set_ids += [value.followed_id]
  end

  return set.followed(followed_set_ids)

end

def sort_by_popularity(type, time, location)

  if type == "Question"
    dummy = Question.first
    popular_set = dummy.most_popular(time, 10000, location)
  end
  if type == "Challenge"
    dummy = Challenge.first
    popular_set = dummy.most_popular(time, 10000, location)
  end
  if type == "Event"
    dummy = Event.first
    popular_set = dummy.most_popular(time, 10000, location)
  end
end

def sort_by_location(distance, location, type, set)
  if type == "Question"
    dummy = Question.new

  end
  if type == "Challenge"
    dummy = Challenge.new

  end
  if type == "Event"
    dummy = Event.new

  end
  max_to_grab = 1000
  return dummy.sift_circle(distance, location, max_to_grab, set)
end

def sort_by_user(set, user)
  return set.where(:user_id => user)
end

end

