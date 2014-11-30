class DashboardController < ApplicationController
  def show
    @location_hash = Gmap.new(current_user).build_map!
    @user = current_user
  end
end
