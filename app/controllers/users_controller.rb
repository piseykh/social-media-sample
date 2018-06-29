class UsersController < ApplicationController
  before_action :set_user, only: [:show,:edit, :update]

  def new
    @user = User.new
  end

  def edit
  end

  def show
    @activities = Post.where(user_id: @user.id).order(created_at: :desc)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
    else
      render "new"
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    end
  end

  def friends
    @friends = []
    @followers = current_user.followers
    @followers.each do |f|
      @friends.push(f.followable)
    end
    @user = current_user
  end

  def find_friends
    @followers = current_user.followers
    @friends =[]
    @followers.each do |f|
      @friends.push(f.followable_id)
    end
    @users =  User.where.not(id: @friends.unshift(current_user.id))
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
