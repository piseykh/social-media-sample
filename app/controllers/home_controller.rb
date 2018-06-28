class HomeController < ApplicationController
  before_action :set_user, except: :front

  def front
    @activities = Post.all.order(created_at: :desc)
  end

  def index
    unless @user
      return redirect_to front_path
    end
    @post = Post.new
    @followers = @user.followers
    @friends = [@user.id]
    @followers.each do |f|
      @friends.push(f.followable_id)
    end
    @activities = Post.where(user_id: @friends).order(created_at: :desc)
  end

  private
  def set_user
    @user = current_user
  end
end
