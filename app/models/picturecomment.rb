class Picturecomment < ActiveRecord::Base
  has_one :comment, as: :content
  belongs_to :image
end
