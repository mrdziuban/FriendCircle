class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.find_all_by_user_id(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    user_fc_ids = @current_user.fcms.pluck("fc_id")
    post_fc_ids = @post.fcs.pluck("fcs.id")
    redirect_to user_url(@current_user) if (user_fc_ids & post_fc_ids).empty?
  end

  def new
    @post = Post.new
  end

  def create
    params[:post][:user_id] = @current_user.id
    @post = Post.new(params[:post])
    if @post.save
      redirect_to post_url(@post)
    else
      render :new
    end
  end

  def destroy

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to post_url(@post)
    else
      render :edit
    end
  end

end