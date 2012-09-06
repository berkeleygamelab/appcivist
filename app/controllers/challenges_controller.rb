 def retrieve_google(db_return)
    rtn = []
    db_return.each do |x|
      rtn += [x[:id]]
    end
    return Question.followed(rtn)
  end
class ChallengesController < ApplicationController
 autocomplete :category, :name
  # GET /challenges/1
  # GET /challenges/1.json
  def show

    @sample = Challenge.all.pop
     @samples = @sample.kludgy_related_similar()
     puts "whatup"
     @different_samples = @sample.kludgy_related_other()
    if current_user == nil
      redirect_to home_login_url
    else
      @challenge = Challenge.find(params[:id])
      @category = Category.where(:name => @challenge.categories.split(","))
      @responses = ResponseTemplate.where(:item_id => @challenge.item_template.id).where(:parent_id => nil)
      @response = ResponseTemplate.new(:item_id => @challenge.item_template.id)
      #@vote = vote_permission(current_user)
      #@most_popular_prop dzx
      
    end
  end

  # PUT /challenges/1
  # PUT /challenges/1.json
  def update
    @challenge = Challenge.find(params[:id])

    respond_to do |format|
      if @challenge.update_attributes(params[:challenge])
        format.html { redirect_to @challenge, notice: 'Challenge was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
  if params[:q]
    @categories = Category.all(:conditions => ["name like ?", params[:q] + '%'])
  else
    @categories = Category.all
  end

  respond_to do |wants|
    wants.html
    wants.js
  end

end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy

    respond_to do |format|
      format.html { redirect_to challenges_url }
      format.json { head :ok }
    end
  end

  def create
       if request.post?
      puts "WORK IT GURL"
      @challenge = Challenge.new(params[:challenge])
      puts params
      @challenge.user_id = current_user.id
      geocode = Geocoder.coordinates(@challenge.location)
      @challenge.lat = geocode[0].to_s
      @challenge.lng = geocode[1].to_s
      if params[:category]
        @challenge.categories = params[:category]
      end
      respond_to do |format|
        if @challenge.save
          @challenge.insert_location(@challenge.lat + ', ' + @challenge.lng)
          format.html { redirect_to @challenge, notice: 'Question was successfully created.' }
          format.json { render json: @challenge, status: :created, location: @challenge }
        else
          format.html { render action: "new" }
          format.json { render json: @challenge.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  
  def challengeNew
    @challenge = Challenge.new
          @sample = Question.all.pop
      if (!@sample.nil?)
        @samples = @sample.kludgy_related_similar()
      else
        @samples = []
      end
  end


end
