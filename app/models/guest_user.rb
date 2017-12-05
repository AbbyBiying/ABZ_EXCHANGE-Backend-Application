class GuestUser
  def username
    "Guest"
  end
  
  # defalut location for guest user is New York, NY
  def latitude
    40.7127753
  end

  def longitude
    -74.0059728
  end

  def followings?(_user)
    false
  end
end
