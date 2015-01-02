class Location < ActiveRecord::Base
  has_many :users
  geocoded_by :city
  after_validation :geocode

  validates :city, presence: true, uniqueness: true
  validates :state, presence: true

  def self.by_most_recent
    order(created_at: :desc)
  end
end
