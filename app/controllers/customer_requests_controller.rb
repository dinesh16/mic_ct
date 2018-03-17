class CustomerRequestsController < ApplicationController
  def new
    @customer_request = CustomerRequest.new
  end

  def create
    @customer_request = CustomerRequest.new(customer_request_params)
    @customer_request.submit

    if @customer_request.api_errors.present?
      render :new
    else
      redirect_to thank_you_url, notice: I18n.t(:thank_you_message)
    end
  end

  private

  def customer_request_params
    params.require(:customer_request).permit(
      :name, :business_name, :email, :telephone_number
    )
  end
end
