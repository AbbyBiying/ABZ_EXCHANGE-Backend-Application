class User < ActiveRecord::Base

  belongs_to :location

  accepts_nested_attributes_for(
    :location,
    reject_if: proc { |attributes| attributes["city"].blank? }
  )

  delegate :city, to: :location
  delegate :latitude, to: :location
  delegate :longitude, to: :location
  delegate :state, to: :location

  has_many :comments
  has_many :images

  validates :email, presence: true, uniqueness: true
  validates :location, presence: true
  validates :password_digest, presence: true

  def full_street_address
    "#{number}, #{street}, #{city}"
  end

  def to_param
  username
  end
end
