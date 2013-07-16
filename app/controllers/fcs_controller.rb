class FcsController < ApplicationController

  def index
  end

  def new
    @fc = Fc.new
  end

  def create
    @fc = Fc.new(params[:fc])
    p params
    if @fc.save
      redirect_to user_url(@fc.user_id)
    else
      redirect_to user_url(@current_user)
    end
  end

  def show
    @fc = Fc.find(params[:id])
    @users = User.all
  end

end
