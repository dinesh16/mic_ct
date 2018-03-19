require 'rails_helper'

RSpec.describe CustomerRequestsController, type: :controller do
  let(:valid_params) do
    {
      customer_request: {
        name: Faker::Name.name,
        business_name: Faker::Company.name,
        email: Faker::Internet.email,
        telephone_number: Faker::PhoneNumber.cell_phone,
      }
    }
  end

  let(:invalid_params) do
    {
      customer_request: {
        name: nil
      }
    }
  end
  let(:success_message) { { message: 'Enqueue success', errors: [] }.to_json }
  let(:name_error) { "Field 'name' is blank" }
  let(:failed_message) { { message: '', errors: [name_error] }.to_json }

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new customer_request new' do
        stub_api_request(success_message)
        post :create, params: valid_params

        expect(response.status).to eq 302
        expect(response).to redirect_to(thank_you_path)
      end
    end

    context 'with invalid params' do
      it 'returns a errors response and display request form' do
        stub_api_request(failed_message)

        post :create, params: invalid_params

        expect(response.status).to eq 200
        expect(assigns[:customer_request].api_errors).to include(name_error)
      end
    end
  end
end


