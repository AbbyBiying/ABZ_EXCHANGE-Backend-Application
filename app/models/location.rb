class Location < ActiveRecord::Base
  has_many :users
  geocoded_by :full_street_address, presence: true, uniqueness: true
  after_validation :geocode

  validates :city, presence: true, uniqueness: true
  validates :state, presence: true

  def full_street_address
    "#{number}, #{street}, #{city}"
  end
end
