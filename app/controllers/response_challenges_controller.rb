class ResponseChallengesController < ApplicationController

  # GET /response_challenges/new
  # GET /response_challenges/new.json
  def new
    @response_challenge = ResponseChallenge.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @response_challenge }
    end
  end

  # GET /response_challenges/1/edit
  def edit
    @response_challenge = ResponseChallenge.find(params[:id])
  end

  # POST /response_challenges
  # POST /response_challenges.json
  def create
    @response_challenge = ResponseChallenge.new(params[:response_challenge])
    @response_challenge.challenge_id = params[:challenge_id]
    @response_challenge.user_id = current_user.id

    respond_to do |format|
      if @response_challenge.save
        format.html { redirect_to @response_challenge.challenge, notice: 'Response challenge was successfully created.' }
        format.json { render json: @response_challenge, status: :created, location: @response_challenge }
      else
        format.html { render action: "new" }
        format.json { render json: @response_challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /response_challenges/1
  # PUT /response_challenges/1.json
  def update
    @response_challenge = ResponseChallenge.find(params[:id])

    respond_to do |format|
      if @response_challenge.update_attributes(params[:response_challenge])
        format.html { redirect_to @response_challenge, notice: 'Response challenge was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @response_challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /response_challenges/1
  # DELETE /response_challenges/1.json
  def destroy
    @response_challenge = ResponseChallenge.find(params[:id])
    @response_challenge.destroy

    respond_to do |format|
      format.html { redirect_to response_challenges_url }
      format.json { head :ok }
    end
  end
end
