class IntervieweesController < ApplicationController
   before_filter :authenticate_user!, except: [:index, :show]
  # GET /interviewees
  # GET /interviewees.json
  def index
    @interviewees = Interviewee.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @interviewees }
    end
  end

  # GET /interviewees/1
  # GET /interviewees/1.json
  def show
    @interviewee = Interviewee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @interviewee }
    end
  end

  # GET /interviewees/new
  # GET /interviewees/new.json
  def new

    # @interviewee = Interviewee.new
    @interviewee = current_user.interviewees.build
    @resume = Resume.new
    # @image = Interviewee.create( params[:interviewee] )
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @interviewee }
    end
  end

  # GET /interviewees/1/edit
  def edit
    @interviewee = Interviewee.find(params[:id])
    @resume = Resume.new
  end

  # POST /interviewees
  # POST /interviewees.json
  def create

    if !current_user.interviewees.first.nil? || !current_user.interviewers.first.nil?
     # raise "sorry buddy, you already have one acount"
      flash[:error] = "sorry buddy, you already have one account"
      redirect_to request.referrer
     return
    end

    # @image = Interviewee.create( params[:interviewee] )

    # @interviewee = Interviewee.new(params[:interviewee])
    @interviewee = current_user.interviewees.build(params[:interviewee])

    respond_to do |format|
      if @interviewee.save!
        if ( params[:resume]['name']!= ""  && params[:resume]['attachment']!=nil)
          @resume = Resume.create(params[:resume])
          @resume.update_attributes!(interviewee_id: @interviewee.id)
        end
         
        # puts "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT"
        # puts params[:apply][:remote_apply]

        if !params[:apply][:remote_apply].nil? && params[:apply]==true
          # flash[:notice] = "Interviewee was successfully created."
          # redirect_to interviews_url(apply:'true', vacant_id:params[:vacant_id][:remote_apply]) ,:method => :post


          @interview = Interview.new
          
          if @interview.save
                @interview.update_attributes!(interviewee_id: current_user.interviewees.first.id, vacant_job_id:params[:vacant_id][:remote_apply])
          end
            

          format.html { redirect_to interviews_url , notice: 'Interview successfully created.' }
          format.json { render json: interviews_url , status: :created, location: interviews_url  }
        else
           format.html { redirect_to @interviewee, notice: 'Interviewee was successfully created.' }
          format.json { render json: @interviewee, status: :created, location: @interviewee }
        end

      else
        format.html { render action: 'new' }
        format.json { render json: @interviewee.errors, status: :unprocessable_entity }
      end
    end

  end

  # PUT /interviewees/1
  # PUT /interviewees/1.json
  def update
    @interviewee = Interviewee.find(params[:id])

    # && params[:resume]["attachment"] !=nil)
    if ( params[:resume]["name"]!= ""  && params[:resume]["attachment"]!=nil)
      @resume = Resume.create(params[:resume])
      @resume.update_attributes!(interviewee_id: @interviewee.id)
    end

    respond_to do |format|
      if @interviewee.update_attributes(params[:interviewee])
        format.html { redirect_to @interviewee, notice: 'Interviewee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @interviewee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interviewees/1
  # DELETE /interviewees/1.json
  def destroy
    @interviewee = Interviewee.find(params[:id])
    @interviewee.destroy

    respond_to do |format|
      format.html { redirect_to interviewees_url }
      format.json { head :no_content }
    end
  end
end
