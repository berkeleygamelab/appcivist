class SentController < ApplicationController
  def index
     @messages = current_user.messages
   end

   def create
     @messages = current_user.messages
   end

   def new
     @messages = current_user.messages
   end

   def show
     @messages = current_user.messages
     
     if (params[:subject] != nil)
       b = Message.new
       b.user = current_user
       b.subject = params[:subject]
       b.body = params[:body]
       b.save
       msgCopy = MessageCopy.new
       msgCopy.message = b
       msgCopy.user = User.where(:login => params[:sendTo]).first
       msgCopy.save
     end
  end
    
    def special
      @messages = current_user.messages
    @success = "Progress? :D"
    end
    

end
