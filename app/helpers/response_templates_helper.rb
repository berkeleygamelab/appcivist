module ResponseTemplatesHelper
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
end
