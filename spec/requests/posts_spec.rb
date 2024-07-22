require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let!(:user) { create(:user) }
  let(:token) { user.generate_jwt }

  describe "GET /posts" do
    it "returns a list of posts" do
      get '/posts', headers: { 'Authorization' => "Bearer #{token}" }
      expect(response).to have_http_status(:ok)
      expect(json_response).to be_an(Array)
    end
  end

  describe "GET /posts/:id" do
    let!(:post) { create(:post, user: user) }

    it "returns a specific post" do
      get "/posts/#{post.id}", headers: { 'Authorization' => "Bearer #{token}" }
      expect(response).to have_http_status(:ok)
      expect(json_response['id']).to eq(post.id)
    end
  end

  # describe "POST /posts" do
  #   it "returns a forbidden error" do
  #     post '/posts', headers: { 'Authorization' => "Bearer #{token}" }, params: { post: { title: 'New Post', text: 'Content for new post' } }, as: :json
  #     expect(response).to have_http_status(:forbidden)
  #     expect(json_response['error']).to eq('Ação não permitida')
  #   end
  # end

  # describe "PUT /posts/:id" do
  #   let!(:post) { create(:post, user: user) }

  #   it "returns a forbidden error" do
  #     put "/posts/#{post.id}", headers: { 'Authorization' => "Bearer #{token}" }, params: { post: { title: 'Updated Title' } }, as: :json
  #     expect(response).to have_http_status(:forbidden)
  #     expect(json_response['error']).to eq('Ação não permitida')
  #   end
  # end

  # describe "DELETE /posts/:id" do
  #   let!(:post) { create(:post, user: user) }

  #   it "returns a forbidden error" do
  #     delete "/posts/#{post.id}", headers: { 'Authorization' => "Bearer #{token}" }, as: :json
  #     expect(response).to have_http_status(:forbidden)
  #     expect(json_response['error']).to eq('Ação não permitida')
  #   end
  # end
end