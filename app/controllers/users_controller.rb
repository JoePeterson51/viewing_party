class UsersController < ApplicationController
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
      redirect_to dashboard_path
    else
      flash[:alert] = "Must fill out all fields/confirm password"
      render :new
    end
  end

  def show
    friend_ids = current_user.friendships.select(:friend_id).distinct.pluck(:friend_id)
    @friendships = User.find(friend_ids)
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
# IDK HOW TO DO THIS.
  #   <%= form_with model: @friendship, local: true do |form| %>
  #   <%= form.label :email, 'Email:' %>
  #   <%= form.submit 'Add Friend' %>
  # <% end %>
end