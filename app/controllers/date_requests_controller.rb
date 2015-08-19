class DateRequestsController < ApplicationController
  before_filter :set_date_request, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @date_requests = DateRequest.all
    respond_with(@date_requests)
  end

  def show
    respond_with(@date_request)
  end

  def new
    @date_request = DateRequest.new
    respond_with(@date_request)
  end

  def edit
  end

  def create
    @date_request = DateRequest.new(params[:date_request])
    @date_request.save
    # respond_with(@date_request)

    redirect_to interviews_url
  end

  def update
    @date_request.update_attributes(params[:date_request])
    respond_with(@date_request)
  end

  def destroy
    @date_request.destroy
    respond_with(@date_request)
  end

  private
    def set_date_request
      @date_request = DateRequest.find(params[:id])
    end
end
