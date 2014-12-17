class Counteroffer < ActiveRecord::Base
  belongs_to :user
  belongs_to :offer

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true

  def self.by_most_recent
    order(created_at: :desc)
  end
end
