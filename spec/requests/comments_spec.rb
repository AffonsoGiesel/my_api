require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let!(:user) { create(:user) }
  let(:token) { user.generate_jwt }
  let!(:post) { create(:post, user: user) }
  let!(:comment) { create(:comment, post: post) }

  describe "GET /posts/:post_id/comments" do
    it "returns a list of comments" do
      get "/posts/#{post.id}/comments", headers: { 'Authorization' => "Bearer #{token}" }
      expect(response).to have_http_status(:ok)
      expect(json_response).to be_an(Array)
    end
  end

  describe "GET /posts/:post_id/comments/:id" do
    it "returns a specific comment" do
      get "/posts/#{post.id}/comments/#{comment.id}", headers: { 'Authorization' => "Bearer #{token}" }
      expect(response).to have_http_status(:ok)
      expect(json_response['id']).to eq(comment.id)
    end
  end

  describe "POST /posts/:post_id/comments" do
    it "returns a forbidden error" do
      post "/posts/#{post.id}/comments", 
           headers: { 'Authorization' => "Bearer #{token}" },
           params: { comment: { comment: 'Text for new comment', post_id: post.id } },
           as: :json
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe "PUT /posts/:post_id/comments/:id" do
    it "returns a forbidden error" do
      put "/posts/#{post.id}/comments/#{comment.id}", headers: { 'Authorization' => "Bearer #{token}" }, params: { comment: { comment: 'Updated Comment' } }
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe "DELETE /posts/:post_id/comments/:id" do
    it "returns a forbidden error" do
      delete "/posts/#{post.id}/comments/#{comment.id}", headers: { 'Authorization' => "Bearer #{token}" }
      expect(response).to have_http_status(:forbidden)
    end
  end
end
