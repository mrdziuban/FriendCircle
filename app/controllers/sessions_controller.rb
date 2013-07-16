class SessionsController < ApplicationController

  before_filter :authenticate_user, except: ["new", "create"]

  def create
    user = User.find_by_name(params[:session][:name])
    if current_user = user.authenticate(params[:session][:password])
      current_user.token = SecureRandom.urlsafe_base64(10)
      session[:token] = current_user.token
      redirect_to user_url(current_user)
    else
      render :new
    end
  end

  def destroy
    current_user.token = nil
    session[:token] = nil
    redirect_to :new
  end

end

