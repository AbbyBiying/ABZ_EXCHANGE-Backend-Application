class Image < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
end
