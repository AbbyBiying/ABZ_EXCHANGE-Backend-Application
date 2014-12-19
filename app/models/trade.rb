class Trade < ActiveRecord::Base
  belongs_to :offer
  belongs_to :counter_offer

  validates_uniqueness_of :counter_offer, scope: :offer
end
