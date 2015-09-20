class Image < ActiveRecord::Base
  has_attached_file :avatar,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/missing_avatar.png"

  belongs_to :guest_user
  belongs_to :user
  has_many :comments, as: :commentable

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true

  def created_time
    created_at.strftime("%H:%M, %m/%d/%Y %Z")
  end

  def self.by_most_recent
    order(created_at: :desc)
  end

  def self.find_image(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
