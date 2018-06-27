class HomeController < ApplicationController
  before_action :set_user, except: :front

  def front
    @activities = Post.all.order(created_at: :desc)
  end

  def index
    unless current_user
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

  def find_friends
    @followers = @user.followers
    puts "=====find_friends",@friends

    @friends =[]
    @followers.each do |f|
      @friends.push(f.followable_id)
    end
    @users =  User.where.not(id: @friends.unshift(@user.id))
  end

  private
  def set_user
    @user = current_user
  end
end
