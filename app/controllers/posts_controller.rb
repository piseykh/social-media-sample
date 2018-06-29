class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def show
    @comments = @post.comments.all
    @user =current_user
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      files=params.require(:post).permit(:file1,:file2,:file3)
      files.each do |f|
        if f
          Attachment.new({:file=>f[1],:post_id=>@post.id}).save
        end
      end
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end

  private
  def set_post
    @post = Post.find_by(id: params[:id])
    render_404 and return unless @post && User.find_by(id: @post.user_id)
  end

  def post_params
    params.require(:post).permit(:content_text)
  end
end