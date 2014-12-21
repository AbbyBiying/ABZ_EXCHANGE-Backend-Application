class Trade < ActiveRecord::Base
  belongs_to :offer
  belongs_to :counter_offer

  validates_uniqueness_of :counter_offer, scope: :offer

  def offer_username
    offer.user.username
  end

  def counter_offer_username
    counter_offer.user.username
  end
end
