require 'rails_helper'

RSpec.describe 'Courses API', type: :request do
  let!(:user) { create(:user) }

  let(:valid_headers) { auth_headers(user) }

  let(:valid_params) do
    {
      title: 'Rails Basics',
      description: 'Intro to Rails',
      tutors_attributes: [
        { first_name: 'Jane', last_name: 'Doe', email: 'jane@example.com' }
      ]
    }
  end

  describe 'GET /api/v1/courses' do
    before { create_list(:course, 25) }

    it 'returns paginated courses with token' do
      get '/api/v1/courses', headers: valid_headers
      expect(response).to have_http_status(:ok)
      expect(json["courses"].size).to eq(10) # Default pagination
      expect(json['meta']).to include('current_page', 'total_pages', 'total_count')
    end

    it 'returns correct page when page param is provided' do
      get '/api/v1/courses?page=2', headers: valid_headers
      expect(response).to have_http_status(:ok)
      expect(json['meta']['current_page']).to eq(2)
    end

    it 'returns unauthorized without token' do
      get '/api/v1/courses'
      expect(response).to have_http_status(:unauthorized)
      expect(json['errors']).to eq('Invalid token')
    end

    it 'returns unauthorized with invalid token' do
      get '/api/v1/courses', headers: { 'Authorization' => 'Bearer bad.token' }
      expect(response).to have_http_status(:unauthorized)
      expect(json['errors']).to eq('Invalid token')
    end
  end

  describe 'POST /api/v1/courses' do
    it 'creates a course and tutor with valid data' do
      post '/api/v1/courses', params: valid_params.to_json, headers: valid_headers
      expect(response).to have_http_status(:created)
      expect(json['course']['title']).to eq('Rails Basics')
      expect(json['course']['tutors'].first['email']).to eq('jane@example.com')
    end

    it 'returns error when course title is missing' do
      params = valid_params.except(:title)
      post '/api/v1/courses', params: params.to_json, headers: valid_headers
      expect(response).to have_http_status(:unprocessable_entity)
      expect(json['errors']).to include("Title can't be blank")
    end

    it 'returns error when tutor email is missing' do
      params = valid_params.deep_dup
      params[:tutors_attributes][0].delete(:email)
      post '/api/v1/courses', params: params.to_json, headers: valid_headers
      expect(response).to have_http_status(:unprocessable_entity)
      expect(json['errors']).to include("Tutors email can't be blank")
    end

    it 'returns error for invalid email format' do
      params = valid_params.deep_dup
      params[:tutors_attributes][0][:email] = 'invalidemail'
      post '/api/v1/courses', params: params.to_json, headers: valid_headers
      expect(response).to have_http_status(:unprocessable_entity)
      expect(json['errors']).to include('Tutors email is invalid')
    end

    it 'returns unauthorized without auth' do
      post '/api/v1/courses', params: valid_params.to_json
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
