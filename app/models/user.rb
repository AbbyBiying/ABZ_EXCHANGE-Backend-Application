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

  has_many(
    :followed_relationships,
    class_name: "FollowRelationship",
    foreign_key: :"follower_id"
  )

  has_many :followed_users, through: :followed_relationships

  has_many(
    :follower_relationships,
    class_name: "FollowRelationship",
    foreign_key: :"followed_user_id"
  )

  has_many :followers, through: :follower_relationships

  validates :email, presence: true, uniqueness: true
  validates :location, presence: true
  validates :password_digest, presence: true

  def full_street_address
    "#{number}, #{street}, #{city}"
  end

  def followings?(user)
    user.followers.include?(self)
  end

  def timeline
    Comment.where(user_id: includes_myself).order(created_at: :desc)
  end

  def includes_myself
    [id] + followed_user_ids
  end

  def follow(user)
    followed_users << user
  end

  def unfollow(user)
    followed_users.destroy(user)
  end

  def following?(user)
    followed_users.include? user
  end
end
