class MapsController < ApplicationController
  def show
    location = Location.find(params[:id])
    @map = Map.new(location)
  end
end
