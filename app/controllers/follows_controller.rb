class FollowsController < ApplicationController
  def create
    @follow = current_user.followers.new({:followable_id =>params[:format]})
    @follow.save
    @user=@follow.followable
  end

  def destroy
    Follow.find_by(follower_id:current_user.id,followable_id:params[:id]).destroy
    @user = User.find(params[:id])
  end
end