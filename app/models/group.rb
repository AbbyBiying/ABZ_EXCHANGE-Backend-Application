class Group < ActiveRecord::Base
  has_attached_file :avatar,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/missing_avatar.png"

  has_many :comments, as: :commentable
  has_many :images
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true

  def created_time
    created_at.strftime("%H:%M, %m/%d/%Y %Z")
  end

  def self.by_most_recent
    order(created_at: :desc)
  end

  def self.find_group(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
