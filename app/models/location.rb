class Location < ActiveRecord::Base
  has_many :users
  geocoded_by :city_and_state
  after_validation :geocode

  before_validation :upcase_city
  before_validation :upcase_state
  validates :city, presence: true, uniqueness: { scope: :state, message: "Sorry, the location already exists in our dropdown menu." }
  validates :state, presence: true

  def self.by_most_recent
    order(created_at: :desc)
  end

  def city_and_state
    "#{city}, #{state}"
  end

  def upcase_city
    self.city = self.city.upcase if self.city.present?
  end

  def upcase_state
    self.state = self.state.upcase if self.state.present?
  end
end
