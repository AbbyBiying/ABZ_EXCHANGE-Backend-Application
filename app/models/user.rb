class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :listings

  def owns?(listing)
    self == listing.user
  end
end
