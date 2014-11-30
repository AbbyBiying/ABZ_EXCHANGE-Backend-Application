class SuccessfulExchange < ActiveRecord::Base
  belongs_to :exchange

  delegate :listing, to: :exchange
  delegate :offer, to: :exchange

  def created_time
    created_at.strftime("%H:%M, %m/%d/%Y %Z")
  end

  def self.by_most_recent
    order(created_at: :desc)
  end
end
