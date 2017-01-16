module Authenticable
  extend ActiveSupport::Concern

  def current_user
    request.headers['Authorization']
  end
end
