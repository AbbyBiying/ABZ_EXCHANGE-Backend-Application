class Trade < ActiveRecord::Base
  belongs_to :listing
  belongs_to :offer

  validates_uniqueness_of :offer, scope: :listing

  def offer_username
    offer.user.username
  end

  def listing_username
    listing.user.username
  end
end
