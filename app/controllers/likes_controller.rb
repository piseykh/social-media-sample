class LikesController < ApplicationController

  def create
    like = current_user.likes.new({:post_id => params[:likeable_id]})
    like.save
    @likeable = Post.find(params[:likeable_id])
  end

  def destroy
    Like.find_by(post_id:params[:likeable_id],user_id:current_user.id).destroy
    @likeable = Post.find(params[:likeable_id])
  end
end
