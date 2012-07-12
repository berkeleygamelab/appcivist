class ResponseEventsController < ApplicationController

  # GET /response_events/new
  # GET /response_events/new.json
  def new
    @response_event = ResponseEvent.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @response_event }
    end
  end

  # GET /response_events/1/edit
  def edit
    @response_event = ResponseEvent.find(params[:id])
  end

  # POST /response_events
  # POST /response_events.json
  def create
    @response_event = ResponseEvent.new(params[:response_event])
    @response_event.event_id = params[:event_id]
    @response_event.user_id = current_user.id

    respond_to do |format|
      if @response_event.save
        format.html { redirect_to @response_event.event, notice: 'Response event was successfully created.' }
        format.json { render json: @response_event, status: :created, location: @response_event }
      else
        format.html { render action: "new" }
        format.json { render json: @response_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /response_events/1
  # PUT /response_events/1.json
  def update
    @response_event = ResponseEvent.find(params[:id])

    respond_to do |format|
      if @response_event.update_attributes(params[:response_event])
        format.html { redirect_to @response_event, notice: 'Response event was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @response_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /response_events/1
  # DELETE /response_events/1.json
  def destroy
    @response_event = event.find(params[:id])
    @response_event.destroy

    respond_to do |format|
      format.html { redirect_to response_events_url }
      format.json { head :ok }
    end
  end
end
