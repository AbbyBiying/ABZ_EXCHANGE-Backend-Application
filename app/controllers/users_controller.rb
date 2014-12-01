class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def index
    @users = User.all
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow user.bio
    end
  end

  def show
    redirect_to root_path
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      if params[:user][:password].present?
        reset_password(@user, params[:user][:password])
      end
      sign_in(@user)
      flash[:success] = "Update success! Welcome to your dashboard!"
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :bio,
      :number,
      :street,
      :city,
      :state,
      :country,
      :username,
      :latitude,
      :longitude
      )
  end
end

