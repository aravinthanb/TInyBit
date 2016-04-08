class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to root_url
      flash["alert alert-success"] = "Sign Up Successful"
    else
      redirect_to signup_path
      flash["alert alert-warning"] = @user.errors.full_messages
    end
  end

  def home
    @user = User.find_by_username(params[:username])
    @posts = @user.posts
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
