class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :show, :index]
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  before_filter :verify_jwt_token, except: [:new, :create, :index], if: "request.format.symbol == :json" 

  def new
    @user = User.new
    @user.location = Location.new
    @locations = Location.order_by_city
  end

  def index
    if params[:user] && params[:user][:username]
      @users = User.where("username ILIKE ?", "%#{params[:user][:username]}%")

    else
      @users = User.all
    end

    @locations = Location.order_by_city
    @locations_json = @users.map { |user| {lat:user.latitude, lng:user.longitude} }.to_json
  
    respond_to do |format|
      format.html  
      format.json { render json: @users }
      format.xml { render xml: @users }
    end
  end

  def show
    @user = find_user
    respond_to do |format|
      if @user == current_user
        format.html { redirect_to root_path }
        format.json { render json: @user }
      else
        format.html { render :show }
        format.json { render json: @user }
      end
    end
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
        @locations = Location.order_by_city

        flash.now[:error] = "Something wrong with your input!"

        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = current_user
    @locations = Location.order_by_city    

    respond_to do |format|
      format.html  
      format.json { render json: @users }
      format.xml { render xml: @users }
    end
  end

  def update
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        flash[:notice] = "User was successfully updated!"
        # redirect_to root_path
        # format.html { redirect_to(@user, notice: 'User was successfully updated.') }
        format.html{ render :show }
        format.json { render json: @user, status: :ok, location: @user }

      else
        @locations = Location.order_by_city
             
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def find_user
    User.find(params[:id])
  end

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
 

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(
      :sign_up, 
      keys: [
        :avatar,
        :bio,
        :email,
        :location_id,
        :number,
        :password,
        :username, 
        location_attributes: [
          :city, :state
        ]
      ]
    )
  end
end
