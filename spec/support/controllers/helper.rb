module Controllers
  def valid_sign_in(user = nil)
    user ||= create(:user)
    sign_in user
  end

  def user_signed_in
  end
end
