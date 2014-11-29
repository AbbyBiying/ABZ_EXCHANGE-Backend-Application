class UserLocation < ActiveRecord::Base
  belongs_to :location
  belongs_to :user

  validates :user, uniqueness: { scope: :location }
end
