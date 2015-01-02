class Offer < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing

  delegate :accepted?, to: :listing
  delegate :username, to: :user

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true

  def self.by_most_recent
    order(created_at: :desc)
  end

  def created_time
    created_at.strftime("%H:%M, %m/%d/%Y %Z")
  end
end
