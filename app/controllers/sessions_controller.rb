class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      log_in user
      redirect_to root_path
      flash["alert alert-success"] = "Siged In"
    else
      redirect_to login_path
      flash["alert alert-danger"] = "Username or Password Incorrect"
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
