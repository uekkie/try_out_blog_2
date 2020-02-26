class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[show edit new create update destroy]
  before_action :set_user, only: %i[new show edit create update destroy]
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  def new
    @post = Post.new
  end

  def create
    @post = @user.posts.build(post_params)
    if @post.save
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to user_post_path(@user, @post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_url
  end

  private
  
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
