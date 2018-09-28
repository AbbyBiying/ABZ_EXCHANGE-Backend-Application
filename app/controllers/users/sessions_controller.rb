# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  require 'auth_token'
  # Disable CSRF protection
  skip_before_action :verify_authenticity_token

  # Be sure to enable JSON
  respond_to :html, :json

  before_action :configure_sign_in_params, only: [:create]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def create

    # This is the default behavior from devise - view the sessions controller source:
    # https://github.com/plataformatec/devise/blob/master/app/controllers/devise/sessions_controller.rb#L16
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?

    # Here we're deviating from the standard behavior by issuing our JWT
    # to any JS based client.
    respond_to do |format|
      format.html { super }
      format.json { 
        token = AuthToken.issue_token({ user_id: resource.id })

        render json: {user: resource.email, token: token} 
      }
    end

    # The default behavior would have been to simply fire respond_with:
    # respond_with resource, location: after_sign_in_path_for(resource)
  end

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
