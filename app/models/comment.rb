class Comment < ActiveRecord::Base
  has_attached_file :avatar,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/missing_avatar.png"

  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :body, presence: true

  def created_time
    created_at.strftime("%H:%M, %m/%d/%Y %Z")
  end

  def self.by_most_recent
    order(created_at: :desc)
  end

  def self.text_comments(ids)
    where(content_type: "TextComment", content_id: ids)
  end

  def username
    user.username
  end

  def self.find_comment(search)
    where("body ILIKE ?", "%#{search}%")
  end
end
