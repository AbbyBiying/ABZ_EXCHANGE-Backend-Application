class Offer < ActiveRecord::Base
  belongs_to :user
  has_many :counteroffers

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true

  def created_time
    created_at.strftime("%H:%M, %m/%d/%Y %Z")
  end

  def self.by_most_recent
    order(created_at: :desc)
  end
end
