class ResponseTemplatesController < ApplicationController

   def item_set_path(item)
     case item.producible_type
      when "Question"
         question_url(item)
      when "Challenge"
         challenge_url(item)
      when "Event"
         event_url(item)
      end
   end
def create
  puts params
  @params = params
  @response = ResponseTemplate.new(params[:response_template])
  puts @response.item_id
  if @response.item_id == nil
    @response.item_id = params[:response_template]["item_id"].to_i
  end
  if current_user
    @response.user_id = current_user.id
  else
    ERROR
  end
  if @response.save!
    @success = true
  else
    @success = false
    @error = "Error"
  end
  @item = ItemTemplate.where(:item_id => @response.item_id).first
  redirect_to item_set_path(@item)
end

def upvote
  puts params
  @response = ResponseTemplate.where(:id => params[:response_id]).first
  @vote = ResponseVote.where(:id => params[:response_id]).where(:user_id => current_user.id).first
  if @vote.value <= 0
    @response.score += 1
    @response.save
  end
end

def downvote
  @response = ResponseTemplate.where(:id => params[:response_id]).first
  @vote = ResponseVote.where(:id => params[:response_id]).where(:user_id => current_user.id).first
  if @vote.value >= 0
    @response.score -= 1
    @response.save
  end
end

end
