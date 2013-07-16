class SessionsController < ApplicationController

  before_filter :authenticate_user, except: ["new", "create"]

  def create
    user = User.find_by_name(params[:session][:name])
    if user
      if user.authenticate(params[:session][:password])
        user.token = SecureRandom.urlsafe_base64(10)
        user.update_attributes(password: params[:session][:password],
                            password_confirmation: params[:session][:password])
        user.save
        session[:token] = user.token
        redirect_to user_url(user)
      else
        render :new
      end
    else
      render :new
    end
  end

  def destroy
    @current_user = nil
    session[:token] = nil
    render :new
  end

end

