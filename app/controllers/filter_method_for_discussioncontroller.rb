#params: keyword, array of types, time before, time after, subscribing,category,user,location

def filter
	size_limit_questions = 15
	size_limit_discussion = 5
	page_offset = 0
	@collection = []
	@flagsort = false
	@cat_id = params[:category] # it's an integer
	@startDate = params[:timeBefore]
	@endDate = params[:timeAfter]
	@types = params[:types] #array of strings that specifies what type of item we're filtering for; names like question, challenge, event
	if @endDate==nil
		@endDate = Time.now
	end
	@events = []
	@questions = []
	@challenges = []
	@location_to_grab = params[:loc]
	@target_user = params[:by_user]
	  if(@location_to_grab == nil)
    if !current_user.nil?
      temp = Geocoder.coordinates(current_user.location)
      @location_to_grab = temp[0].to_s + " " + temp[1].to_s
    end
  end
end
	