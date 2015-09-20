class Exchange < ActiveRecord::Base
  belongs_to :listing
  belongs_to :offer

  has_many :comments, as: :commentable
  has_one :successful_exchange

  validates_uniqueness_of :offer, scope: :listing

  def completed?
    successful_exchange.present?
  end

  def offer_username
    offer.user.username
  end

  def listing_username
    listing.user.username
  end
end
