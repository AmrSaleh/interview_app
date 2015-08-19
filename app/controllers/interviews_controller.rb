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
    authorize! :show,@interview.interviewee
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
    authorize! :show,:all
  end

  # POST /interviews
  # POST /interviews.json
  def create
    if(current_user.admin? || !current_user.interviewees.first.nil?)
      @interview = Interview.new(params[:interview])

      if !@interview.interviewer.nil?
              @interview.interviewer.interviews.each do |interview|
                if interview.date == @interview.date
                  flash[:error] = "same interviewer already has an interview at the same date"
                  redirect_to request.referrer
                  return
                end
              end
      end
      respond_to do |format|
        if @interview.save

            if !params[:apply].nil? && params[:apply]=="true"
              @interview.update_attributes!(interviewee_id: current_user.interviewees.first.id, vacant_job_id:params[:vacant_id])
                puts "EMAIL_EMAIL_EMAIL_EMAIL_EMAIL_EMAIL_EMAIL_EMAIL_EMAIL_EMAIL_EMAIL_EMAIL_EMAIL_EMAIL_EMAIL_EMAIL_EMAIL_EMAIL_"
          UserEmail.apply_notify(@interview).deliver
            end

            format.html { redirect_to @interview, notice: 'Interview was successfully created.' }
            format.json { render json: @interview, status: :created, location: @interview }
        else
            format.html { render action: "new" }
            format.json { render json: @interview.errors, status: :unprocessable_entity }
        end
      end
    else
              
              flash[:notice] = "Please fill in your information first"
              redirect_to new_interviewee_url(apply:'true', vacant_id:params[:vacant_id])
    end
  end

  # PUT /interviews/1
  # PUT /interviews/1.json
  def update
    @interview = Interview.find(params[:id])

if  @interview.interviewer !=nil
      @interview.interviewer.interviews.each do |interview|
        if interview.date == @interview.date
          flash[:error] = "same interviewer already has an interview at the same date"
          redirect_to request.referrer
          return
        end
      end
end
    
      # puts "+++++++++++++++++++++++++++newDate++++++++++++++++++++++++++"
      # puts params[:newDate].nil?
      # puts params[:newDate]
      # puts "++++++++++++++++++++++++interview date+++++++++++++++++++"
      # # puts params[:interview][:date].nil?
      # # puts params[:interview][:date]
      # puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

       if !params[:newDate].nil?
        params[:interview] = {}
        params[:interview][:date] = params[:newDate]
       end

      puts "+++++++++++++++++++++++++IF ENDED++++++++++++++++++++++++++"

    respond_to do |format|
      if @interview.update_attributes(params[:interview])
        format.html { redirect_to @interview, notice: 'Interview was successfully updated.' }
        # format.json { head :no_content }
        format.json { render json: @interview }
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
  					event = {url:"/interviews/"+interview.id.to_s,interview_id: interview.id,start: interview.date, title: interview.interviewee.name + " with "+ interview.interviewer.name+ "\n"+ interview.vacant_job.name+ "\n" + interview.score.to_s}
  					events.push(event)
          end
        end
        end
#     Interview.all.to_json
			render json: events
    end

    def deny
      # interview = Interview.find(params[:id])
      # interview.update_attributes!(date: params[:newDate])

      request = DateRequest.find(params[:requestID])
      request.delete

      flash[:notice] = "interview date remains the same and request revoked"
      redirect_to interviews_url
    end

    def approve
      puts "7777777777777777777777777777777777777"
      puts params[:id]
      puts params[:newDate]
      puts params[:requestID]
      puts "7777777777777777777777777777777777777" 

      interview = Interview.find(params[:id])
      interview.update_attributes!(date: params[:newDate])

      request = DateRequest.find(params[:requestID])
      request.delete

      flash[:notice] = "interview date updated"
      redirect_to interviews_url
    end


end
