class QuestionsController < ApplicationController
  autocomplete :category, :name
  size_limit_questions = 15
  size_limit_discussion = 5
  page_offset = 1
  auto_complete_for :category, :name
  # GET /questions/1
  # GET /questions/1.json
  def index
    @questions = Question.all
  end
  def show
    if current_user == nil
      redirect_to home_login_url
    else
      @question = Question.where(:id => params[:id])[0]
      @user = User.where(:id => @question.user_id).first
      if @user == nil
        @user = User.where(:id => 15).first
      end
      @categories = @question.categories

       @sample = Question.first
        @samples = @sample.kludgy_related_similar()
        @different_samples = @sample.kludgy_related_other()

  #    @followed = current_user.followed_questions.where(:question_id => params[:id]).size != 0
      #@followed_user = current_user.followed_users.where(:followed_user_id => @question.user_id).size != 0

     # @num_events = 0
    #  @question.challenges.each { |challenge|
     #   @num_events += challenge.events.length
     # }
     puts 'do we play by the same rules brah?'
     @q = @question
     if @q.nil?
       @resp_id = nil
     else
     @resp_id = @q.id
     @responses = ResponseTemplate.where(:item_id => @q.producible_id).where(:parent_id => nil)
     end
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @question }
      end
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    if (!current_user.nil?)
      @question = Question.new
      @category = Category.new
      @sample = Question.all.pop
      if (!@sample.nil?)
        @samples = @sample.kludgy_related_similar()
      else
        @samples = []
      end
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @question }
        end
    else
      redirect_to '/'
    end
  end

  def auto
@categories = Category.find(:all,:conditions => ['name LIKE ?', "#{params[:q]}%"],  :limit => 5, :order => 'name')
respond_to do |format|
format.html # auto.html.erb
format.xml  { render :xml => @cities }
format.js # auto.js.erb
format.json { render :json => @cities }
end

end

def createComment
  comment = params[:comment]
  if comment.save?
    
  end
end

  def newForm
    @question = Question.new
    @category = Category.new
    @categories = Category.all
     @sample = Question.all.pop
      @samples = @sample.kludgy_related_similar()
    puts "BLEEP BLOOP BLEEP BLEEP"
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
  def create
    if request.post?
      puts "WORK IT GURL"
      @question = Question.new(params[:question])
      puts params
      @question.user_id = current_user.id
      geocode = Geocoder.coordinates(@question.location)
      @question.lat = geocode[0].to_s
      @question.lng = geocode[1].to_s
      if params[:category]
        @question.categories = params[:category]
      end
      respond_to do |format|
        if @question.save
          @question.insert_location(@question.lat + ', ' + @question.lng)
          format.html { redirect_to @question, notice: 'Question was successfully created.' }
          format.json { render json: @question, status: :created, location: @question }
        else
          format.html { render action: "new" }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :ok }
    end
  end


  def prefetch
    size_limit_questions = 15
    size_limit_discussion = 5
    page_offset = 1
    @questions = Question.find(:all, :offset => page_offset * size_limit_questions, :limit =>size_limit_questions)
    @discussion_next = []
    @questions.each {|x|  @discussion_next = @discussion_next + [ResponseQuestion.where(:question_id => x.id).limit(size_limit_discussion)]}

  end

  def filter_by_category
    @questions = Question.where(:category => category_to_sort).limit(size_limit_questions).offset(size_limit_questions*page_offset)
    @discussion_next = []
    @questions.each{|x| @discussion_sets = @discussion_sets + ResponseQuestion.where(:question_id => x.id).limit(size_limit_discussion)}
  end


  def filter_by_set_definition
  end

  def auto
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

end
