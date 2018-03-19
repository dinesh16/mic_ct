# frozen_string_literal: true

# Customer request model non db active model
class CustomerRequest
  include ActiveModel::Model

  attr_accessor :name, :business_name, :email, :telephone_number, :api_errors

  def submit
    response = Api::Lead.new.submit(instance_values).symbolize_keys
    @api_errors = response[:errors] if response[:errors].present?
  end
end
