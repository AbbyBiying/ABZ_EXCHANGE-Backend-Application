class Gmap
  def initialize(positions)
    @positions = positions
  end

  def build_map!
    Gmaps4rails.build_markers(@positions) do |position, marker|
      marker.lat position.latitude
      marker.lng position.longitude
      marker.picture(
        "height" => 32,
        "width" => 32,
        "url" => "http://bit.ly/12Zjpr6"
      )
    end
  end
end
