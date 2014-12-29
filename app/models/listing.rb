class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :offers
  has_one :trade

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true

  def accepted?
    trade.present?
  end

  def created_time
    created_at.strftime("%H:%M, %m/%d/%Y %Z")
  end

  def self.by_most_recent
    order(created_at: :desc)
  end

  def self.find_listing(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
