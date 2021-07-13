class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    user = user_params
    if user[:password] != user[:password_confirmation]
      flash[:alert] = "Must fill out all fields/confirm password"
    end
    user[:username] = user[:username].downcase
    new_user = User.create(user)
    if new_user.save
      session[:user_id] = new_user.id
      flash[:success] = "Welcome, #{new_user.username}!"
      redirect_to user_dashboard_index_path
    else
      flash[:alert] = "Must fill out all fields/confirm password"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end