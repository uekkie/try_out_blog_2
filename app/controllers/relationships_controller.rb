class RelationshipsController < ApplicationController

  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
  end

  def destroy
    @user = current_user.following.find(params[:user_id])
    current_user.unfollow(@user)
  end
end
