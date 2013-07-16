class UsersController < ApplicationController
  before_filter :authenticate_user, except: ["new", "create"]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      @user.token = SecureRandom.urlsafe_base64(10)
      session[:token] = @user.token
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def feed
    @user = User.find(params[:id])
    if @current_user.id != @user.id
      redirect_to user_url(@current_user)
    end
  end
end
