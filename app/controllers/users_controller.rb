class UsersController < ApplicationController
  before_action :set_user
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
      redirect_to root_url, :notice => "Signed up!"
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
    @friends =[]
    @followers= @user.followers
    @followers.each do |f|
      @friends.push(f.followable)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
