class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user

  def authenticate_user
    session[:token] ||= SecureRandom.urlsafe_base64(10)
    @current_user = User.find_by_token(session[:token])
    unless @current_user
      redirect_to new_sessions_url
    end
  end

end
