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

    respond_to do |format|
      if @user.valid?
        UserMailer.welcome_email(@user).deliver

        sign_in(@user)

        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }

      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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
      :avatar,
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
