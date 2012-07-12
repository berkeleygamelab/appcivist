class ProposalsController < ApplicationController
  # GET /proposals/1
  # GET /proposals/1.json
  def show
    @proposal = Proposal.find(params[:id])

    respond_to do |format|
      format.html { redirect_to @proposal.challenge }# show.html.erb
      format.json { render json: @proposal }
    end
  end

  # GET /proposals/new
  # GET /proposals/new.json
  def new
    @proposal = Proposal.new

    respond_to do |format|
      format.html { redirect_to @proposal.challenge }
      format.json { render json: @proposal }
    end
  end

  # GET /proposals/1/edit
  def edit
    @proposal = Proposal.find(params[:id])
  end

  # POST /proposals
  # POST /proposals.json
  def create
    @proposal = Proposal.new(params[:proposal])
    @proposal.challenge_id = params[:challenge_id]
    @proposal.user_id = current_user.id
    
    respond_to do |format|
      if @proposal.save
        format.html { redirect_to @proposal.challenge, notice: 'Proposal was successfully created.' }
        format.json { render json: @proposal.challenge, status: :created, location: @proposal }
      else
        format.html { render action: "new" }
        format.json { render json: @proposal.challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /proposals/1
  # PUT /proposals/1.json
  def update
    @proposal = Proposal.find(params[:id])

    respond_to do |format|
      if @proposal.update_attributes(params[:proposal])
        format.html { redirect_to @proposal.challenge, notice: 'Proposal was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @proposal.challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposals/1
  # DELETE /proposals/1.json
  def destroy
    @proposal = Proposal.find(params[:id])
    @proposal.destroy

    respond_to do |format|
      format.html { redirect_to summary_path }
      format.json { head :ok }
    end
  end
  
  respond_to :json
  
  def vote
    @voting_record = VotingRecord.new()
    @voting_record.user_id = current_user.id
    @voting_record.proposal_id = params[:id]

    @voting_record.save
    respond_with(true)
  end 
end
