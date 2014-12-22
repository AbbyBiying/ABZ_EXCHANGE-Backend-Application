class GuestUser
  def username
    "Guest"
  end

  def latitude
    0.0
  end

  def longitude
    0.0
  end

  def followings?(_user)
    false
  end
end
