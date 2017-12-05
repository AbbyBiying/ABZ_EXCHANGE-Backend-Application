class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = authenticate_session(session_params)

    if sign_in(user)
      redirect_to root_path
    else
      flash.now[:error] = "Wrong email or password"
      render :new
    end
  end

  def destroy
    sign_out
    flash[:notice] = "You are successfully signed out!"
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:password, :email)
  end
end
