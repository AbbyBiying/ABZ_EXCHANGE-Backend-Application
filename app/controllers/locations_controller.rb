class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def show
    @location = Location.find(params[:id])
  end

  def index
    @locations = Location.all
    @location_hash = Gmap.new(@locations).build_map!
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to locations_path
    else
      render :new
    end
  end

  private

  def location_params
    params.require(:location).permit(
      :city,
      :country,
      :number,
      :latitude,
      :longitude,
      :state,
      :street
      )
  end
end
