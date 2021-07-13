class User::DashboardController < ApplicationController
  def index
    friend_ids = current_user.friendships.select(:friend_id).distinct.pluck(:friend_id)
    @friendships = User.find(friend_ids)
    if params[:search_by_username] != "" || !User.find_by(username: params[:search_by_username]).nil?
      @user = User.find_by(username: params[:search_by_username])
    elsif User.find_by(username: params[:search_by_username]).nil?
      flash[:alert] = "User not found."
      redirect to user_dashboard_index_path
    end
  end
end