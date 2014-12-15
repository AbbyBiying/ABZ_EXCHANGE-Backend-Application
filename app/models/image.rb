class Image < ActiveRecord::Base
  belongs_to :user
  belongs_to :content, polymorphic: true
  has_many :textcomments
  has_many :picturecomments
  has_many :comments, as: :content

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
end
