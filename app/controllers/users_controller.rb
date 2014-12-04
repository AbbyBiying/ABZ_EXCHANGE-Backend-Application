class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
    @users = User.all
  end

  def index
    @users = User.all
  end

  def show
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
      :bio,
      :email,
      :location_id,
      :number,
      :password,
      :username
    )
  end
end

