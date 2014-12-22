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

  def followings?(user)
    false
  end
end
