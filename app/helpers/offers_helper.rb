module OffersHelper
  def current_user_is_offer_user?(offer)
    current_user == offer.listing.user
  end

  def user_is_current_user?(offer)
    @user == current_user 
  end

  def offer_can_be_accepted?(offer)
    !offer.accepted? && current_user.can_accept?(offer.listing) 
  end
end