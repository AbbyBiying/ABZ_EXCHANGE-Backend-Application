module ExchangesHelper
  def current_user_is_offer_user?(exchange)
    current_user == exchange.offer.user
  end

  def current_user_is_listing_user?(exchange)
    current_user == exchange.listing.user 
  end

  def exchange_in_process?(exchange)
    (current_user.id == exchange.listing.user_id && !exchange.completed?) ||
  (current_user.id == exchange.offer.user_id && !exchange.completed?) 
  end
end