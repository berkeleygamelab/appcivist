class CategoriesController < ApplicationController
  
def index
@categories = Category.find(:all,:conditions => ['name LIKE ?', "#{params[:q]}%"],  :limit => 5, :order => 'name')
respond_to do |format|
format.html # index.html.erb
format.xml  { render :xml => @categories }
format.js # index.js.erb
format.json { render :json => @categories }
end
end
    def auto_complete_for_message_to

    @categories = Category.find(:all , :conditions=>"name like              '%"+user_name.downcase+"%'")
    render :partial => 'username'
    end
end
