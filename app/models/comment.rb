class Comment < ActiveRecord::Base
  belongs_to :content, polymorphic: true
  belongs_to :image
  belongs_to :user

  validates :content, presence: true

  def username
    user.username
  end
end
