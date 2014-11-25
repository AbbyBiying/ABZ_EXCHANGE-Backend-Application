class Image < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true

  def created_time
    created_at.strftime("%H:%M, %m/%d/%Y %Z")
  end
end
