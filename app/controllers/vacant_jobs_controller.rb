class VacantJobsController < ApplicationController
  # GET /vacant_jobs
  # GET /vacant_jobs.json
  def index
    @vacant_jobs = VacantJob.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vacant_jobs }
    end
  end

  # GET /vacant_jobs/1
  # GET /vacant_jobs/1.json
  def show
    @vacant_job = VacantJob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vacant_job }
    end
  end

  # GET /vacant_jobs/new
  # GET /vacant_jobs/new.json
  def new
    @vacant_job = VacantJob.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vacant_job }
    end
  end

  # GET /vacant_jobs/1/edit
  def edit
    @vacant_job = VacantJob.find(params[:id])
  end

  # POST /vacant_jobs
  # POST /vacant_jobs.json
  def create
    @vacant_job = VacantJob.new(params[:vacant_job])

    respond_to do |format|
      if @vacant_job.save
        format.html { redirect_to @vacant_job, notice: 'Vacant job was successfully created.' }
        format.json { render json: @vacant_job, status: :created, location: @vacant_job }
      else
        format.html { render action: "new" }
        format.json { render json: @vacant_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vacant_jobs/1
  # PUT /vacant_jobs/1.json
  def update
    @vacant_job = VacantJob.find(params[:id])

    respond_to do |format|
      if @vacant_job.update_attributes(params[:vacant_job])
        format.html { redirect_to @vacant_job, notice: 'Vacant job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vacant_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacant_jobs/1
  # DELETE /vacant_jobs/1.json
  def destroy
    @vacant_job = VacantJob.find(params[:id])
    @vacant_job.destroy

    respond_to do |format|
      format.html { redirect_to vacant_jobs_url }
      format.json { head :no_content }
    end
  end
end
