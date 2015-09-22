class Offer < ActiveRecord::Base
  has_attached_file :avatar,
    styles: { medium: "300x300>", thumb: "100x100>" },
    storage: :s3,
    s3_credentials: "config/s3.yml",
    default_url: "/images/photo_default.png"

  belongs_to :user
  belongs_to :listing
  has_many :comments, as: :commentable

  delegate :accepted?, to: :listing
  delegate :username, to: :user

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true

  validates_attachment_content_type :avatar, content_type: /\Aimage/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]

  def self.by_most_recent
    order(created_at: :desc)
  end

  def created_time
    created_at.strftime("%A, %B %d, %Y")
  end

  def self.find_offer(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
