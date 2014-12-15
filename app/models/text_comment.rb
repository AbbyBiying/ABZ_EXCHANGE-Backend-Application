class TextComment < ActiveRecord::Base
  has_one :comment, as: :content

  def self.search(query)
    where("body ILIKE ?", "%#{query}%")
  end
end
