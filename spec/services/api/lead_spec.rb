require 'rails_helper'

RSpec.describe Api::Lead do
  let(:params) do
    {
      name: 'Test User',
      business_name: 'Test Business',
      email: 'test_email@test.com',
      telephone_number: '02011112222'
    }
  end

  it 'returns enqueue success message' do
    # used development credentials to make the call success
    VCR.use_cassette 'services/api/lead' do
      response = Api::Lead.new.submit(params)
      expect(response[:message]).to eq('Enqueue success')
      expect(response[:errors]).to be_empty
    end
  end
end
