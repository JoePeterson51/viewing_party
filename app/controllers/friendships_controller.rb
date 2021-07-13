class FriendshipsController <ApplicationController
  def create
    @friendship = current_user.friendships.create(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to user_dashboard_index_path
    else
      flash[:notice] = "Unable to add friend."
      redirect_to user_dashboard_index_path
    end
  end

  def update

  end

  def destroy

  end
end