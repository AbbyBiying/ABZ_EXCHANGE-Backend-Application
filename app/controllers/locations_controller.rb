class LocationsController < ApplicationController
  def create
    location = Location.new(location_params)
    location.name = location.name.downcase
    location.city = location.city.downcase
    location.state = location.state.downcase

    if location.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  private

  def location_params
    params.require(:location).permit(
      :name,
      :state,
      :latitude,
      :longitude
      )
  end
end
