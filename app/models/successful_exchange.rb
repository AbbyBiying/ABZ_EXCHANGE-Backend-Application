class SuccessfulExchange < ActiveRecord::Base
  belongs_to :exchange

  delegate :listing, to: :exchange
  delegate :offer, to: :exchange
end
