class Comment < ActiveRecord::Base
  belongs_to :content, polymorphic: true
  belongs_to :image
  belongs_to :user

  validates :content, presence: true

  def self.textcomments(ids)
    where(content_type: "Textcomment", content_id: ids)
  end

  def username
    user.username
  end
end
