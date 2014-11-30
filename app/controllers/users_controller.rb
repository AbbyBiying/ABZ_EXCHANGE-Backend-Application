class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
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
    if current_user.update(user_params)
      sign_in(current_user)
      flash[:success] = "Welcome to your dashboard!"
      redirect_to current_user
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
      :password,
      :latitude,
      :longitude
      )
  end
end

