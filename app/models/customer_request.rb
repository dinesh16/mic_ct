# frozen_string_literal: true

# Customer request model non db active model
class CustomerRequest
  include ActiveModel::Model

  attr_accessor :name, :business_name, :email, :telephone_number, :api_errors

  def submit
    # response = Api::Lead.new.submit(instance_values)
    # @api_errors = response[:errors] if response[:errors].present?
    ""
  end
end


# Thank you for requesting a call from Make It Cheaper
# We've received your request and one of our saving experts will be in touch within the next five minutes.

# Speed things up
# Whether you're looking to have a chat about your energy, insurance or telecoms, having some useful information to hand when we call can help to speed up the process of comparing prices and switching.

# Speak soon - we're looking forward to it!
