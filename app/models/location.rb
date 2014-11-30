class Location < ActiveRecord::Base
  geocoded_by :name_city_state
  after_validation :geocode
  has_many :users
  has_many :user_locations

  def name_city_state
    "#{name}, #{city}, #{state}"
  end

  def self.find_by_name(city_name)
    find_by(name: city_name.downcase)
  end

  def self.names
    all.map { |location| location.name }
  end
end
