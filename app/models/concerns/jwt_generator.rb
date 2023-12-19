# frozen_string_literal: true

module JwtGenerator
  extend ActiveSupport::Concern

  def generate_jwt
    exp = Time.now.to_i + 3600 # Token expiry time (1 hour in this case)
    jti_raw = [id, SecureRandom.uuid]
    jti = Digest::MD5.hexdigest(jti_raw.join(':'))

    payload = { id: id, exp: exp, jti: jti }

    JWT.encode(payload, Rails.application.credentials.secret_key_base, 'HS256')
  end
end
