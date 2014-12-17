class FollowsController < ApplicationController
  def create
    user = User.find(params[:id])
    user.followers << current_user
    redirect_to user
  end

  def destroy
    user = User.find(params[:id])
    user.followers.delete(current_user)

    redirect_to user
  end
end
