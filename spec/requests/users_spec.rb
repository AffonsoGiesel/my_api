require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:user) { create(:user) }
  let(:token) { user.generate_jwt }

  describe "GET /users" do
    it "returns a list of users" do
      get '/users', headers: { 'Authorization' => "Bearer #{token}" }
      expect(response).to have_http_status(:ok)
      expect(json_response).to be_an(Array)
    end
  end

  describe "GET /users/:id" do
    it "returns a specific user" do
      get "/users/#{user.id}", headers: { 'Authorization' => "Bearer #{token}" }
      expect(response).to have_http_status(:ok)
      expect(json_response['id']).to eq(user.id)
    end
  end
end
