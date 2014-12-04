class NullLocation
  def city
    ""
  end

  def state
    ""
  end

  def latitude
    0
  end

  def longitude
    0
  end

  def to_partial_path
    "locations/location"
  end
end
