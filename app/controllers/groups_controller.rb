class GroupsController < ApplicationController

  def show
    @group = Group.find(params[:id])
   # @followed_user = current_user.followees.where(:followee_id => @user_id).size != 0
    @items = ItemTemplate.where(:user_id => 15).paginate(:page => params[:page], :per_page => 15)
  end

  def index
    @default_categories = Category.where(:default_cat => true)
    if (!current_user.nil?)
    @groups = Group.all
     @my_categories = current_user.categories
     @my_areas = current_user.tagged_areas
     @popular_categories = []
     #@items = @items.paginate(:page => params[:page], :per_page => 5)
    #uts @items
    end
    @item_templates = ItemTemplate.paginate(:page => params[:page], :per_page => 5)
  end
  
  def edit
  end
  
  
  
  def members
  end
  
  def project
  end
end
