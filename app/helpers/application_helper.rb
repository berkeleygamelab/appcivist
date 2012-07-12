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
end
