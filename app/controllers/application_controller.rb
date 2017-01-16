class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  include Authenticable

  private
  def render_not_found
    render json: { errors: "Not found" }, status: 404
  end

  def render_bad_request
    render json: { errors: "Bad request" }, status: 400
  end
end
