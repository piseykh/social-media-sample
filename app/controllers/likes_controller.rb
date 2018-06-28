class LikesController < ApplicationController
  def create
    like = current_user.likes.new({:post_id => params[:format]})
    like.save
    @likeable = Post.find(params[:format])
  end

  def destroy
    Like.find_by(post_id:params[:id],user_id:current_user.id).destroy
    @likeable = Post.find(params[:id])
  end
end
