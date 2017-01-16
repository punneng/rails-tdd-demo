module Authenticable
  extend ActiveSupport::Concern

  def current_user
    request.headers['Authorization'] == "Bearer #{Rails.application.secrets.authorization_token}"
  end

  def authenticate_with_token!
    render json: { errors: "Not authenticated" },
                status: :unauthorized unless current_user
  end
end
