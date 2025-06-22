require 'rails_helper'

RSpec.describe 'User Authentication', type: :request do
  let!(:user) { create(:user) }

  it 'returns JWT token with valid credentials' do
    post '/api/v1/login', params: { email: user.email, password: 'password123' }

    expect(response).to have_http_status(:ok)
    expect(json['token']).to be_present
  end

  it 'fails with invalid credentials' do
    post '/api/v1/login', params: { email: user.email, password: 'wrongpass' }

    expect(response).to have_http_status(:unauthorized)
    expect(json['error']).to eq('Invalid email or password')
  end
end
