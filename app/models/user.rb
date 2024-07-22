class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null


  has_many :posts, dependent: :destroy

  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  def generate_jwt
    JWT.encode({ user_id: id, exp: 60.days.from_now.to_i }, SECRET_KEY, 'HS256')
  end

  def self.decode_jwt(token)
    decoded = JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')
    HashWithIndifferentAccess.new(decoded[0])
  rescue JWT::DecodeError
    nil
  end
end
  