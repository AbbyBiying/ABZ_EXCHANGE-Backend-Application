class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def show
    @location = Location.find(params[:id])
  end

  def index
    @locations = Location.all
    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
      marker.picture(
        "url" => "http://bit.ly/1vFJs1n",
        "width" => 32,
        "height" => 32
      )
    end
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
