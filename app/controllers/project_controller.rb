class ProjectController < ApplicationController

  def new
     if (current_user.nil?)
        redirect_to '/'
     end
  end
end
