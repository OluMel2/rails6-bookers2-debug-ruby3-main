class RelationshipsController < ApplicationController
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def followings
      user = User.find(params[:id])
      @users = user.following_user.page(params[:page])
  end

  def followers
      user = User.find(params[:id])
      @users = user.follower_user.page(params[:page])
  end

end
