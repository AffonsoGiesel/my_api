require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:token) { user.generate_jwt }
  let(:decoded_token) { User.decode_jwt(token) }

  it "generates a valid JWT token" do
    expect(decoded_token).not_to be_nil
    expect(decoded_token['user_id']).to eq(user.id)
  end
end
