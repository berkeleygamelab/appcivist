class MailboxController < ApplicationController
  def show
     @messages = current_user.message_copys
  end

  def inbox
    @messages = current_user.message_copys
  end

  def index
        @message = Message.create
        @message.user = current_user
        @message.subject = params[:subject]
        @message.body = params[:body]
        @message_send = MessageCopy.create

        @message_send.user = User.where(:login => params[:sendTo])[0]
        @success = "NAY!"

        if @message.save
           @success = "YAY!"
           @message_send.message = @message
           @message_send.save
         end
    end

  def respond
      @message.user = current_user
      @message.subject = params[:subject]
      @message.body = params[:body]
      @message_send = MessageCopy.create

      @message_send.user = User.where(:login => params[:sendTo])[0]
      @success = "NAY!"
 
      if @message.save
         @success = "YAY!"
         @message_send.message = @message
         @message_send.save
       end
  end

  def display
    @message = current_user.message[params[:id]]
  end
  

end
