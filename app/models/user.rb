class User < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing_avatar.png"

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
  has_many :offers
  has_many :listings

  has_many(
    :followed_relationships,
    class_name: "FollowRelationship",
    foreign_key: :"follower_id"
  )

  has_many :followed_users, through: :followed_relationships

  has_many(
    :follower_relationships,
    class_name: :"FollowRelationship",
    foreign_key: :"followed_user_id"
  )

  has_many :followers, through: :follower_relationships
  has_many :exchanges
  has_many :successful_exchanges

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :location, presence: true
  validates :password_digest, presence: true

  validates_attachment_content_type :avatar, content_type: /\Aimage/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]

  def can_accept?(possible_offer)
    listings.include?(possible_offer)
  end

  def includes_myself
    [id] + followed_user_ids
  end

  def self.by_most_recent
    order(created_at: :desc)
  end

  def self.find_user(search)
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

  # def following?(user)
  #   followed_users.include? user
  # end

  def timeline
    Comment.where(user_id: includes_myself).order(created_at: :desc)
  end
end
