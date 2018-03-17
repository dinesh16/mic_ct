class CustomerRequestsController < ApplicationController
  before_action :set_customer_request, only: [:show, :edit, :update, :destroy]

  # GET /customer_requests
  def index
    @customer_requests = CustomerRequest.all
  end

  # GET /customer_requests/1
  def show
  end

  # GET /customer_requests/new
  def new
    @customer_request = CustomerRequest.new
  end

  # GET /customer_requests/1/edit
  def edit
  end

  # POST /customer_requests
  def create
    @customer_request = CustomerRequest.new(customer_request_params)

    if @customer_request.save
      redirect_to @customer_request, notice: 'Customer request was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /customer_requests/1
  def update
    if @customer_request.update(customer_request_params)
      redirect_to @customer_request, notice: 'Customer request was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /customer_requests/1
  def destroy
    @customer_request.destroy
    redirect_to customer_requests_url, notice: 'Customer request was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_request
      @customer_request = CustomerRequest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def customer_request_params
      params.fetch(:customer_request, {})
    end
end
