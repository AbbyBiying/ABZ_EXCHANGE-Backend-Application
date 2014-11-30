class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :comments
  has_many :images
  has_many :user_locations
  has_and_belongs_to_many :locations

  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    "#{number} #{street}, #{city}"
  end

  def owns?(image)
    self == listing.user
  end

  private

  def find_location(city_name)
    @location = Location.find_by(name: city_name.downcase)
  end
end
