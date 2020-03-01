class Posts::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @post.likes.create!(user: current_user)
    @post.reload
  end

  def destroy
    @post.likes.find(params[:id]).destroy!
    @post.reload
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
