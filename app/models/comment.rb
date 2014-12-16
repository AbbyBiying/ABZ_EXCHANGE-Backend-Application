class Comment < ActiveRecord::Base
  belongs_to :content, polymorphic: true
  belongs_to :image
  belongs_to :user

  validates :content, presence: true

  def created_time
    created_at.strftime("%H:%M, %m/%d/%Y %Z")
  end

  def self.text_comments(ids)
    where(content_type: "TextComment", content_id: ids)
  end

  def username
    user.username
  end
end
