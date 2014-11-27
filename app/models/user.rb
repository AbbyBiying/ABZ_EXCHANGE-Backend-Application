class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :comments
  has_many :images
  has_many :user_locations
  has_and_belongs_to_many :locations

  def owns?(image)
    self == listing.user
  end

  private

  def find_location(city_name)
    @location = Location.find_by(name: city_name.downcase)
  end
end
