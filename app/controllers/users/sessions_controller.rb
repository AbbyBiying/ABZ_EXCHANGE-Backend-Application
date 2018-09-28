# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # Disable CSRF protection
  skip_before_action :verify_authenticity_token

  before_action :configure_sign_in_params, only: [:create]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :authenticate_request!
  
  respond_to :html, :json
  
  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, 
      keys: [
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
      ]
    )
  end
end
