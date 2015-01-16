class Location < ActiveRecord::Base
  has_many :users
  geocoded_by :full_street_address
  after_validation :geocode

  validates :city, presence: true
  validates :state, presence: true

  def self.by_most_recent
    order(created_at: :desc)
  end

  def full_street_address
    "#{city}, #{state}"
  end
end
