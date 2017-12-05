class LocationsController < ApplicationController
  before_action :require_login, except: [:index]
  def new
    @locations = Location.order_by_city  
    @location = Location.new
  end

  def show
    @location = Location.find(params[:id])
  end

  def index
    @locations = Location.order_by_city  

    @locations_json = @locations.map { |location| {lat:location.latitude, lng:location.longitude} }.to_json
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
