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

  # def current_user
  #   super || GuestUser.new
  #   # super
  # end
end
