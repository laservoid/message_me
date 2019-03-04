class SessionsController < ApplicationController

  def login

  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have succesfully logged in"
      redirect_to root_path
    else
      flash.now[:error] = "There was something wrong with your login information"
      render 'login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Yopu have succesfully logged out"
    redirect_to login_path
  end
end
