require 'rails_helper'

RSpec.describe Api::Lead do
  let(:result) { { message: 'Enqueue success', errors: [] }.to_json }

  it 'returns enqueue success message' do
    stub_api_request(result)

    response = Api::Lead.new.submit({}).symbolize_keys

    expect(response[:message]).to eq('Enqueue success')
    expect(response[:errors]).to be_empty
  end
end
