class User < ActiveRecord::Base
  delegate :city, to: :location

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :comments
  has_many :images
  belongs_to :location

  def location
    super || NullLocation.new
  end

  def full_street_address
    "#{number}, #{street}, #{city}"
  end
end
