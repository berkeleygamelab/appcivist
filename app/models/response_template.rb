class ResponseTemplate < ActiveRecord::Base
  #acts_as_nested_set
  
  belongs_to :item_template, :foreign_key => :item_id
  attr_accessible :response, :parent_id
  #belongs_to :user, :foreign_key => :user_id

  def upvote
    self.score = self.score + 1
  end

  def downvote
    self.score = self.score - 1
  end

  def get_replies
    @replies = ResponseTemplate.where("item_id = ? AND type = ? AND lft > ? AND rgt < ?", :item_id, :type, :lft, :rgt)
  end

  #Notification message that tells a user he has a received a reply from another user
  #returns a string with the message with the sender and body of the message
  def notifyUser(message_id)
     @sent_id = receveid_messages.find(:id => message_id).sent_message_id
     @sender = User.find(:id => sent_id.sender_id).login
     @body = sent_id.body
     return "Your answer has been responded by " + @sender + ": " + @body
  end
  
  def get_subtree()
    tree = []
    sub_tree = ResponseTemplate.where(:parent_id => self.id)
    tree+= sub_tree
    sub_tree.each do |sub|
      tree+= sub.get_subtree()
    end
    return tree
  end
end
