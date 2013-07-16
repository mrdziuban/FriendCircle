class FcsController < ApplicationController

  def index
  end

  def new
    @fc = Fc.new
    @user = User.find(@current_user.id)
    @users = User.all
  end

  def create
    @fc = Fc.new(params[:fc])
    p params
    if @fc.save
      redirect_to fc_url(@fc)
    else
      render :new
    end
  end

  def show
    @fc = Fc.find(params[:id])
    @users = User.all
  end

  def edit
    @fc = Fc.find(params[:id])
    @user = User.find(@current_user.id)
    @users = User.all
  end

  def update
    @fc = Fc.find(params[:id])
    if @fc.update_attributes(params[:fc])
      redirect_to fc_url(@fc)
    else
      render :edit
    end
  end

end
