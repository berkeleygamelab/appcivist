class ResponseQuestionsController < ApplicationController
  # GET /response_questions/new
  # GET /response_questions/new.json
  def new
    @response_question = ResponseQuestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @response_question }
    end
  end

  # GET /response_questions/1/edit
  def edit
    @response_question = ResponseQuestion.find(params[:id])
  end

  # POST /response_questions
  # POST /response_questions.json
  def create
    @response_question = ResponseQuestion.new(params[:response_question])
    @response_question.question_id = params[:question_id]
    @response_question.user_id = current_user.id

    respond_to do |format|
      if @response_question.save
        format.html { redirect_to @response_question.question, notice: 'Response question was successfully created.' }
        format.json { render json: @response_question, status: :created, location: @response_question }
      else
        format.html { render action: "new" }
        format.json { render json: @response_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /response_questions/1
  # PUT /response_questions/1.json
  def update
    @response_question = ResponseQuestion.find(params[:id])

    respond_to do |format|
      if @response_question.update_attributes(params[:response_question])
        format.html { redirect_to @response_question, notice: 'Response question was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @response_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /response_questions/1
  # DELETE /response_questions/1.json
  def destroy
    @response_question = ResponseQuestion.find(params[:id])
    @response_question.destroy

    respond_to do |format|
      format.html { redirect_to response_questions_url }
      format.json { head :ok }
    end
  end
end
