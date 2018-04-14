module ListingsHelper
  def exchange_present?(listing)
    listing.exchange.present? && listing.exchange.successful_exchange.nil?
  end

  def exchange_accepted?(listing)
    (current_user == listing.user && listing.accepted?) && listing.exchange.successful_exchange.nil? 
  end

  def successful_exchange_present?(listing)
    listing.exchange.present? && listing.exchange.successful_exchange.present?
  end

  def listing_has_comment?(listing)
    listing.comments.any?
  end
end