class User < ActiveRecord::Base
  has_attached_file :avatar,
    styles: { medium: "300x300>", thumb: "100x100>" },
    storage: :s3,
    s3_credentials: "config/s3.yml",
    default_url: "/images/missing_avatar.png"

  belongs_to :location

  accepts_nested_attributes_for(
    :location,
    reject_if: proc { |attributes| attributes["city"].blank? || attributes["state"].blank?}
  )

  delegate :city, to: :location
  delegate :latitude, to: :location
  delegate :longitude, to: :location
  delegate :state, to: :location

  has_many :comments
  has_many :images
  has_many :offers
  has_many :listings
  has_many :groups

  has_many(
    :followed_relationships,
    class_name: :"FollowRelationship",
    foreign_key: :"follower_id"
  )
  
  has_many(
   :follower_relationships,
    class_name: :"FollowRelationship",
    foreign_key: :"followed_user_id"
  )

  has_many :followed_users, through: :followed_relationships
  has_many :followers, through: :follower_relationships

  has_many :exchanges
  has_many :successful_exchanges

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :location, presence: true
  validates :password_digest, presence: true
  # validate :single_location_specified

  validates_attachment_content_type :avatar, content_type: /\Aimage/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]
  
  extend OrderHelper
  include TimeFormatHelper

  def can_accept?(possible_offer)
    listings.include?(possible_offer)
  end

  def includes_myself
    [id] + followed_user_ids
  end

  def self.find_user_by_username(search)
    where("username ILIKE ?", "%#{search}%")
  end
 
  def followings?(user)
    user.followers.include?(self)
  end

  def follow(user)
    followed_users << user
  end

  def unfollow(user)
    followed_users.destroy(user)
  end

  # def single_location_specified
  #   puts self.attributes
  #   if location && (location_attributes[:city] || location_attributes[:state])
  #   errors[:location] << "Two locations selected."
  #   end
  # end

  def timeline
    Comment.where(user_id: includes_myself).order(created_at: :desc)
  end
end
