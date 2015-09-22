class Comment < ActiveRecord::Base
#   has_attached_file :avatar,
#     styles: { medium: "300x300>", thumb: "100x100>" },
#     storage: :s3,
#     s3_credentials: "config/s3.yml",
#     default_url: "/images/missing_avatar.png"

  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :body, presence: true

  # validates_attachment_content_type :avatar, content_type: /\Aimage/
  # validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]

  def created_time
    created_at.strftime("%A, %B %d, %Y")
  end

  def self.by_most_recent
    order(created_at: :desc)
  end

  def username
    user.username
  end

  def self.find_comment(search)
    where("body ILIKE ?", "%#{search}%")
  end
end
