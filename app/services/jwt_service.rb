# frozen_string_literal: true

class JwtService
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  # Encode the payload into a JWT token with an expiration time.
  # Defaults to expiration of 1 week from now if not provided.
  def self.encode(payload, exp = Rails.application.config.jwt_expiration_time || 1.week.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  # Decode the JWT token and return the decoded payload.
  # Returns nil if the decoding fails.
  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new(decoded)
  rescue JWT::DecodeError => e
    Rails.logger.error("JWT decoding error: #{e.message}") # Optional logging for debug purposes
    nil
  end
end
