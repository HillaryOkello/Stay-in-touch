class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = current_user.friendships.build(friendship_params)

    if @friendship.save
      redirect_to users_path, notice: 'Friend request sent'
    else
      redirect_to users_path, notice: @friendship.errors.fullmessage
    end
  end

  def update
    @friendship = Friendship.find_by(user_id: params[:user_id], friend_id: params[:friend_id])
    @friendship.status = !@friendship.status
    if @friendship.save
      redirect_to current_user, notice: 'Invitation accepted'
    else
      redirect_to current_user, notice: 'Error accepting invitation'
    end
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
