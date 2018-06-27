class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new({:comment => params[:comment], :post_id => params[:commentable_id]})
    @comment.save
  end

  def destroy
    @comment = current_user.comments.find(params[:id]).destroy
    @comment_id = params[:id]
  end

end