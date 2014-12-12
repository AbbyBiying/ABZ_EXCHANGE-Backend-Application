class DashboardsController < ApplicationController
  def show
    @location_hash = Gmap.new(current_user).build_map!
  end
end
