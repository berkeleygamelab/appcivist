class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if @current_user
       cookies[:user_id] = session[:user_id]
    end
    return @current_user
  end
  helper_method :current_user

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

  helper_method :add_follower
  helper_method :remove_follower

end
