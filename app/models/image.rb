class Image < ActiveRecord::Base
  has_attached_file :avatar,
    styles: { medium: "300x300>", thumb: "50x50>" },
    storage: :s3,
    s3_credentials: "config/s3.yml",
    default_url: "/images/photo_default.png"

  # belongs_to :guest_user
  belongs_to :user
  has_many :comments, as: :commentable

  validates :name, presence: true
  validates :description, presence: true

  validates_attachment_content_type :avatar, content_type: /\Aimage/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]
  
  extend OrderHelper
  include TimeFormatHelper
  extend SearchByNameHelper
end
