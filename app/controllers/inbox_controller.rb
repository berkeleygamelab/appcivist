class InboxController < ApplicationController
  def respond
    @message = current_user.message_copys.find(params[:id].to_i).message
  end
  def index
    @messages = current_user.message_copys
  end
  
  def show
    @success = "It a me, mario!"
    if (!current_user.nil?)
      @messages = current_user.message_copys
    end
  end
  
  def new
   
  end
  
  def create
    id = User.find_by_login(params[:sendTo]).id
    body = params[:body]
    subject = params[:subject]
    message = Message.create(:user_id => current_user.id, :body => body, :subject => subject)
    MessageCopy.create(:message_id => message.id, :user_id => id)
    @success = false 
    if message.id != nil
      @success = true
    end
    if @success == false
      redirect_to messages_new_path
    else
      redirect_to messages_inbox_path
    end
    
  end
  
  def destroy_message(msg_id)
    msg = MessageCopy.where(:id => msg_id)
    msg.destroy
  end
  
  def send_to
    @to = params[:id]
  end
end
