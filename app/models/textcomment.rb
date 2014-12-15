class Textcomment < ActiveRecord::Base
  has_one :comment, as: :content
  belongs_to :image

  def self.search(query)
    where("body ILIKE ?", "%#{query}%")
  end
end
