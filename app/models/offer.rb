class Offer < ActiveRecord::Base
  has_attached_file :avatar,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/missing_avatar.png"

  belongs_to :user
  belongs_to :listing
  has_many :comments, as: :commentable

  delegate :accepted?, to: :listing
  delegate :username, to: :user

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true

  def self.by_most_recent
    order(created_at: :desc)
  end

  def created_time
    created_at.strftime("%H:%M, %m/%d/%Y %Z")
  end

  def self.find_offer(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
