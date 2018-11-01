class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user

    respond_to do |format|
      format.html  
      format.json { render json: @user }
      format.xml { render xml: @user }
    end
  end
end
