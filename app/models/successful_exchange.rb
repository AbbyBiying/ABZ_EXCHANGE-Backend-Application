class SuccessfulExchange < ActiveRecord::Base
  belongs_to :exchange
  has_many :comments, as: :commentable

  delegate :listing, to: :exchange
  delegate :offer, to: :exchange

  def created_time
    created_at.strftime("%A, %B %d, %Y")
  end

  def self.by_most_recent
    order(created_at: :desc)
  end
end
