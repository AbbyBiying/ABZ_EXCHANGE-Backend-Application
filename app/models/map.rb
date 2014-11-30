class Map
  attr_accessor :lat, :long
  attr_reader :location

  def initialize(location)
    @location = location
  end

  delegate :latitude, to: :@location
  delegate :longitude, to: :@location
  delegate :listings, to: :@location
end
