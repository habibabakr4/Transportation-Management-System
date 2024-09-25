# spec/controllers/drivers_controller_spec.rb

require 'rails_helper'

RSpec.describe DriversController, type: :controller do
  describe 'POST #signup' do
    context 'with valid attributes' do
      it 'creates a new driver' do
        expect {
          post :signup, params: { driver: { email: 'test@example.com', password: 'password' } }
        }.to change(Driver, :count).by(1)
      end

      it 'returns a success message' do
        post :signup, params: { driver: { email: 'test@example.com', password: 'password' } }
        expect(JSON.parse(response.body)['message']).to eq('Driver created successfully')
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new driver' do
        expect {
          post :signup, params: { driver: { email: nil, password: 'password' } }
        }.not_to change(Driver, :count)
      end

      it 'returns error messages' do
        post :signup, params: { driver: { email: nil, password: 'password' } }
        expect(JSON.parse(response.body)['errors']).to include("Email can't be blank")
      end
    end
  end

  describe 'POST #login' do
  context 'with valid credentials' do
    it 'returns a token' do
      post :login, params: { email: 'test@example.com', password: 'password' }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to have_key('token')
    end

    it 'returns the driver information' do
      post :login, params: { email: 'test@example.com', password: 'password' }
      expect(JSON.parse(response.body)['driver']['email']).to eq('test@example.com')
    end
  end

  context 'with invalid credentials' do
    it 'returns an unauthorized error' do
      post :login, params: { email: 'test@example.com', password: 'wrong_password' }
      expect(response).to have_http_status(:unauthorized)
      expect(JSON.parse(response.body)['error']).to eq('Invalid email or password')
    end
  end
end

end