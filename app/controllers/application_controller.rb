class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:email)
    end

    devise_parameter_sanitizer.permit(
      :sign_up, 
      keys: [
        :avatar,
        :bio,
        :email,
        :location_id,
        :number,
        :password,
        :password_confirmation,
        :username, 
        location_attributes: [
          :city, 
          :state
        ]
      ]
    ) 

    devise_parameter_sanitizer.permit(:account_update, 
      keys: [
        :avatar,
        :bio,
        :email,
        :location_id,
        :number,
        :password,
        :password_confirmation,
        :username, 
        location_attributes: [
          :city, 
          :state
        ]
      ]
    )
  end

  protected
  # check user credentials
  def authenticate_request!
    unless user_id_in_token?
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
      return
    end
    current_user = User.find(auth_token[:user_id])
    
    rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  private

  def http_token
      @http_token ||= if request.headers['Authorization'].present?
        request.headers['Authorization'].split(' ').last
      end
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
  end

  def user_id_in_token?
    http_token && auth_token && auth_token[:user_id].to_i
  end

  # def current_user
  #   super || GuestUser.new
  #   # super
  # end
end
