class InterviewsController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :show]
  # GET /interviews
  # GET /interviews.json
  def index
    @interviews = Interview.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @interviews }
    end
  end

  # GET /interviews/1
  # GET /interviews/1.json
  def show
    @interview = Interview.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @interview }
    end
  end

  # GET /interviews/new
  # GET /interviews/new.json
  def new
    @interview = Interview.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @interview }
    end
  end

  # GET /interviews/1/edit
  def edit
    @interview = Interview.find(params[:id])
  end

  # POST /interviews
  # POST /interviews.json
  def create
   
      @interview = Interview.new(params[:interview])
      respond_to do |format|
        if @interview.save

          if !params[:apply].nil?
            @interview.update_attributes!(interviewee_id: current_user.interviewees.first.id, vacant_job_id:params[:vacant_id])
          end

          format.html { redirect_to @interview, notice: 'Interview was successfully created.' }
          format.json { render json: @interview, status: :created, location: @interview }
        else
          format.html { render action: "new" }
          format.json { render json: @interview.errors, status: :unprocessable_entity }
        end
      end
  end

  # PUT /interviews/1
  # PUT /interviews/1.json
  def update
    @interview = Interview.find(params[:id])

    respond_to do |format|
      if @interview.update_attributes(params[:interview])
        format.html { redirect_to @interview, notice: 'Interview was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interviews/1
  # DELETE /interviews/1.json
  def destroy
    @interview = Interview.find(params[:id])
    @interview.destroy

    respond_to do |format|
      format.html { redirect_to interviews_url }
      format.json { head :no_content }
    end
    
  end
  
    def load_events
    	events = Array.new
    	
    	Interview.all.each do |interview|
    		if can? :show,interview.interviewee
          if !interview.date.nil? && !interview.interviewer.nil?
  					event = {url:"/interviews/"+interview.id.to_s,start: interview.date, title: interview.interviewee.name + " with "+ interview.interviewer.name+ "\n"+ interview.vacant_job.name+ "\n" + interview.score.to_s}
  					events.push(event)
          end
        end
        end
#     Interview.all.to_json
			render json: events
    end
end
