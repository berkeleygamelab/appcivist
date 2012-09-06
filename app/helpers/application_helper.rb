module ApplicationHelper
   def item_path_maker(type, item)
      case type
      when "Question"
         question_url(item)
      when "Challenge"
         challenge_url(item)
      when "Event"
         event_url(item)
      end
   end
   
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
   
   def return_bubble_image_for_item(item)
    if item.producible_type == "Question"
      return "assets/BlueBackgroundPeg.png"
    elsif item.producible_type == "Challenge"
      return "assets/GreenBackground.png"
    elsif item.producible_type == "Event"
      return "assets/OrangeBackground.png"
    end 
  end
end
