class ApplicationController < ActionController::Base
  include Response
  include ExceptionHandler

  protect_from_forgery with: :null_session
  before_action :authenticate_with_token!

  respond_to :json

  private

  # overwrite devise method
  def current_user
    token = request.headers['Authorization'].presence
    @current_user ||= User.find_by_auth_token(token) if token
  end

  # authenticate user
  def authenticate_with_token!
    json_response({ success: false, message: "Not Authenticated." }, :unauthorized) unless current_user.present?
  end
end
