class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create, :index]

  def new
    @user = User.new
    @user.location = Location.new
  end

  def index
    @users = User.all
    @location_hash = Gmap.new(@users).build_map!
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
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
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
      :username,
      location_attributes: [
        :city,
        :state
      ]
    )
  end
end
