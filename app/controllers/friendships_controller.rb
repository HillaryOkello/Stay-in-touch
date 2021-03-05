class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = current_user.pending_friendships.build(user_id: params[:user][:user_id],
      friend_id: params[:user][:friend_id])

    if @friendship.save
      redirect_to users_path, notice: 'Friend request sent'
    else
      redirect_to users_path, notice: @friendship.errors.fullmessage
    end
  end

  def update
    @friendship = Friendship.find_by(user_id: params[:user_id], friend_id: params[:friend_id])
    
    @friendship.confirm_friend
    redirect_to current_user, notice: 'Invitation accepted'
  end

  def destroy
    @friendship = Friendship.find_by(user_id: params[:user_id], friend_id: params[:friend_id])
    if @friendship.destroy
      redirect_to current_user, notice: 'Invitation rejected'
    else
      redirect_to current_user, notice: 'Error accepting rejecting'
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
