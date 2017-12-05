class FollowsController < ApplicationController
  before_action :require_login
  def create
    user = User.find(params[:id])
    user.followers << current_user
    flash[:notice] = "You are successfully following #{user.username}!"

    redirect_to user
  end

  def destroy
    user = User.find(params[:id])
    user.followers.delete(current_user)
    flash[:notice] = "You are no longer following #{user.username}!"
    redirect_to user
  end
end
