class FollowsController < ApplicationController

  def create
    @follow = current_user.followers.new({:followable_id => params[:user_id]})
    @follow.save
    @user=@follow.followable
  end

  def destroy
    @user = User.find(params[:user_id])
    Follow.find_by(follower_id:current_user.id,followable_id:@user.id).destroy
  end
end